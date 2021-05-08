module AWS.Ecr exposing
    ( service
    , batchCheckLayerAvailability, batchDeleteImage, batchGetImage, completeLayerUpload, createRepository, deleteLifecyclePolicy
    , deleteRepository, deleteRepositoryPolicy, describeImages, describeRepositories, getAuthorizationToken, getDownloadUrlForLayer
    , getLifecyclePolicy, getLifecyclePolicyPreview, getRepositoryPolicy, initiateLayerUpload, listImages, listTagsForResource, putImage
    , putImageTagMutability, putLifecyclePolicy, setRepositoryPolicy, startLifecyclePolicyPreview, tagResource, untagResource
    , uploadLayerPart
    , Arn, AuthorizationData, AuthorizationDataList, Base64, BatchCheckLayerAvailabilityRequest, BatchCheckLayerAvailabilityResponse
    , BatchDeleteImageRequest, BatchDeleteImageResponse, BatchGetImageRequest, BatchGetImageResponse, BatchedOperationLayerDigest
    , BatchedOperationLayerDigestList, CompleteLayerUploadRequest, CompleteLayerUploadResponse, CreateRepositoryRequest
    , CreateRepositoryResponse, CreationTimestamp, DeleteLifecyclePolicyRequest, DeleteLifecyclePolicyResponse
    , DeleteRepositoryPolicyRequest, DeleteRepositoryPolicyResponse, DeleteRepositoryRequest, DeleteRepositoryResponse
    , DescribeImagesFilter, DescribeImagesRequest, DescribeImagesResponse, DescribeRepositoriesRequest, DescribeRepositoriesResponse
    , EvaluationTimestamp, ExpirationTimestamp, ForceFlag, GetAuthorizationTokenRegistryIdList, GetAuthorizationTokenRequest
    , GetAuthorizationTokenResponse, GetDownloadUrlForLayerRequest, GetDownloadUrlForLayerResponse, GetLifecyclePolicyPreviewRequest
    , GetLifecyclePolicyPreviewResponse, GetLifecyclePolicyRequest, GetLifecyclePolicyResponse, GetRepositoryPolicyRequest
    , GetRepositoryPolicyResponse, Image, ImageActionType(..), ImageCount, ImageDetail, ImageDetailList, ImageDigest, ImageFailure
    , ImageFailureCode(..), ImageFailureList, ImageFailureReason, ImageIdentifier, ImageIdentifierList, ImageList, ImageManifest
    , ImageSizeInBytes, ImageTag, ImageTagList, ImageTagMutability(..), InitiateLayerUploadRequest, InitiateLayerUploadResponse, Layer
    , LayerAvailability(..), LayerDigest, LayerDigestList, LayerFailure, LayerFailureCode(..), LayerFailureList, LayerFailureReason, LayerList
    , LayerPartBlob, LayerSizeInBytes, LifecyclePolicyPreviewFilter, LifecyclePolicyPreviewResult, LifecyclePolicyPreviewResultList
    , LifecyclePolicyPreviewStatus(..), LifecyclePolicyPreviewSummary, LifecyclePolicyRuleAction, LifecyclePolicyRulePriority
    , LifecyclePolicyText, LifecyclePreviewMaxResults, ListImagesFilter, ListImagesRequest, ListImagesResponse
    , ListTagsForResourceRequest, ListTagsForResourceResponse, MaxResults, MediaType, MediaTypeList, NextToken, PartSize, ProxyEndpoint
    , PushTimestamp, PutImageRequest, PutImageResponse, PutImageTagMutabilityRequest, PutImageTagMutabilityResponse
    , PutLifecyclePolicyRequest, PutLifecyclePolicyResponse, RegistryId, Repository, RepositoryList, RepositoryName, RepositoryNameList
    , RepositoryPolicyText, SetRepositoryPolicyRequest, SetRepositoryPolicyResponse, StartLifecyclePolicyPreviewRequest
    , StartLifecyclePolicyPreviewResponse, Tag, TagKey, TagKeyList, TagList, TagResourceRequest, TagResourceResponse, TagStatus(..), TagValue
    , UntagResourceRequest, UntagResourceResponse, UploadId, UploadLayerPartRequest, UploadLayerPartResponse, Url, imageActionType
    , imageFailureCode, imageTagMutability, layerAvailability, layerFailureCode, lifecyclePolicyPreviewStatus, tagStatus
    )

{-|


## Amazon Elastic Container Registry

Amazon Elastic Container Registry (Amazon ECR) is a managed Docker registry service. Customers can use the familiar Docker CLI to push, pull, and manage images. Amazon ECR provides a secure, scalable, and reliable registry. Amazon ECR supports private Docker repositories with resource-based permissions using IAM so that specific users or Amazon EC2 instances can access repositories and images. Developers can use the Docker CLI to author and manage images.


# Service definition.

@docs service


# Service endpoints.

@docs batchCheckLayerAvailability, batchDeleteImage, batchGetImage, completeLayerUpload, createRepository, deleteLifecyclePolicy
@docs deleteRepository, deleteRepositoryPolicy, describeImages, describeRepositories, getAuthorizationToken, getDownloadUrlForLayer
@docs getLifecyclePolicy, getLifecyclePolicyPreview, getRepositoryPolicy, initiateLayerUpload, listImages, listTagsForResource, putImage
@docs putImageTagMutability, putLifecyclePolicy, setRepositoryPolicy, startLifecyclePolicyPreview, tagResource, untagResource
@docs uploadLayerPart


# API data model.

@docs Arn, AuthorizationData, AuthorizationDataList, Base64, BatchCheckLayerAvailabilityRequest, BatchCheckLayerAvailabilityResponse
@docs BatchDeleteImageRequest, BatchDeleteImageResponse, BatchGetImageRequest, BatchGetImageResponse, BatchedOperationLayerDigest
@docs BatchedOperationLayerDigestList, CompleteLayerUploadRequest, CompleteLayerUploadResponse, CreateRepositoryRequest
@docs CreateRepositoryResponse, CreationTimestamp, DeleteLifecyclePolicyRequest, DeleteLifecyclePolicyResponse
@docs DeleteRepositoryPolicyRequest, DeleteRepositoryPolicyResponse, DeleteRepositoryRequest, DeleteRepositoryResponse
@docs DescribeImagesFilter, DescribeImagesRequest, DescribeImagesResponse, DescribeRepositoriesRequest, DescribeRepositoriesResponse
@docs EvaluationTimestamp, ExpirationTimestamp, ForceFlag, GetAuthorizationTokenRegistryIdList, GetAuthorizationTokenRequest
@docs GetAuthorizationTokenResponse, GetDownloadUrlForLayerRequest, GetDownloadUrlForLayerResponse, GetLifecyclePolicyPreviewRequest
@docs GetLifecyclePolicyPreviewResponse, GetLifecyclePolicyRequest, GetLifecyclePolicyResponse, GetRepositoryPolicyRequest
@docs GetRepositoryPolicyResponse, Image, ImageActionType, ImageCount, ImageDetail, ImageDetailList, ImageDigest, ImageFailure
@docs ImageFailureCode, ImageFailureList, ImageFailureReason, ImageIdentifier, ImageIdentifierList, ImageList, ImageManifest
@docs ImageSizeInBytes, ImageTag, ImageTagList, ImageTagMutability, InitiateLayerUploadRequest, InitiateLayerUploadResponse, Layer
@docs LayerAvailability, LayerDigest, LayerDigestList, LayerFailure, LayerFailureCode, LayerFailureList, LayerFailureReason, LayerList
@docs LayerPartBlob, LayerSizeInBytes, LifecyclePolicyPreviewFilter, LifecyclePolicyPreviewResult, LifecyclePolicyPreviewResultList
@docs LifecyclePolicyPreviewStatus, LifecyclePolicyPreviewSummary, LifecyclePolicyRuleAction, LifecyclePolicyRulePriority
@docs LifecyclePolicyText, LifecyclePreviewMaxResults, ListImagesFilter, ListImagesRequest, ListImagesResponse
@docs ListTagsForResourceRequest, ListTagsForResourceResponse, MaxResults, MediaType, MediaTypeList, NextToken, PartSize, ProxyEndpoint
@docs PushTimestamp, PutImageRequest, PutImageResponse, PutImageTagMutabilityRequest, PutImageTagMutabilityResponse
@docs PutLifecyclePolicyRequest, PutLifecyclePolicyResponse, RegistryId, Repository, RepositoryList, RepositoryName, RepositoryNameList
@docs RepositoryPolicyText, SetRepositoryPolicyRequest, SetRepositoryPolicyResponse, StartLifecyclePolicyPreviewRequest
@docs StartLifecyclePolicyPreviewResponse, Tag, TagKey, TagKeyList, TagList, TagResourceRequest, TagResourceResponse, TagStatus, TagValue
@docs UntagResourceRequest, UntagResourceResponse, UploadId, UploadLayerPartRequest, UploadLayerPartResponse, Url, imageActionType
@docs imageFailureCode, imageTagMutability, layerAvailability, layerFailureCode, lifecyclePolicyPreviewStatus, tagStatus

-}

import AWS.Config
import AWS.Http
import AWS.KVDecode exposing (KVDecoder)
import AWS.Service
import Codec exposing (Codec)
import Enum exposing (Enum)
import Json.Decode exposing (Decoder, Value)
import Json.Decode.Pipeline as Pipeline
import Json.Encode exposing (Value)
import Json.Encode.Optional as EncodeOpt


{-| Configuration for this service.
-}
service : AWS.Config.Region -> AWS.Service.Service
service region =
    AWS.Config.defineRegional "api.ecr" "2015-09-21" AWS.Config.JSON AWS.Config.SignV4 region
        |> AWS.Config.withJsonVersion "1.1"
        |> AWS.Config.withSigningName "ecr"
        |> AWS.Config.withTargetPrefix "AmazonEC2ContainerRegistry_V20150921"
        |> AWS.Service.service


{-| Uploads an image layer part to Amazon ECR.

This operation is used by the Amazon ECR proxy, and it is not intended for general use by customers for pulling and pushing images. In most cases, you should use the `docker` CLI to pull, tag, and push images.

-}
uploadLayerPart : UploadLayerPartRequest -> AWS.Http.Request AWS.Http.AWSAppError UploadLayerPartResponse
uploadLayerPart req =
    let
        encoder val =
            [ ( "uploadId", val.uploadId ) |> EncodeOpt.field (Codec.encoder uploadIdCodec)
            , ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "partLastByte", val.partLastByte ) |> EncodeOpt.field (Codec.encoder partSizeCodec)
            , ( "partFirstByte", val.partFirstByte ) |> EncodeOpt.field (Codec.encoder partSizeCodec)
            , ( "layerPartBlob", val.layerPartBlob ) |> EncodeOpt.field layerPartBlobEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\uploadIdFld repositoryNameFld registryIdFld lastByteReceivedFld ->
                { lastByteReceived = lastByteReceivedFld
                , registryId = registryIdFld
                , repositoryName = repositoryNameFld
                , uploadId = uploadIdFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "uploadId" (Json.Decode.maybe (Codec.decoder uploadIdCodec)) Nothing
                |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing
                |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
                |> Pipeline.optional "lastByteReceived" (Json.Decode.maybe (Codec.decoder partSizeCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "UploadLayerPart" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes specified tags from a resource.
-}
untagResource : UntagResourceRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
untagResource req =
    let
        encoder val =
            [ ( "tagKeys", val.tagKeys ) |> EncodeOpt.field tagKeyListEncoder
            , ( "resourceArn", val.resourceArn ) |> EncodeOpt.field (Codec.encoder arnCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "UntagResource" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Adds specified tags to a resource with the specified ARN. Existing tags on a resource are not changed if they are not specified in the request parameters.
-}
tagResource : TagResourceRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
tagResource req =
    let
        encoder val =
            [ ( "tags", val.tags ) |> EncodeOpt.field (Codec.encoder tagListCodec)
            , ( "resourceArn", val.resourceArn ) |> EncodeOpt.field (Codec.encoder arnCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            AWS.Http.constantDecoder ()
    in
    AWS.Http.request "TagResource" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Starts a preview of the specified lifecycle policy. This allows you to see the results before creating the lifecycle policy.
-}
startLifecyclePolicyPreview : StartLifecyclePolicyPreviewRequest -> AWS.Http.Request AWS.Http.AWSAppError StartLifecyclePolicyPreviewResponse
startLifecyclePolicyPreview req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "lifecyclePolicyText", val.lifecyclePolicyText )
                |> EncodeOpt.optionalField (Codec.encoder lifecyclePolicyTextCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\statusFld repositoryNameFld registryIdFld lifecyclePolicyTextFld ->
                { lifecyclePolicyText = lifecyclePolicyTextFld
                , registryId = registryIdFld
                , repositoryName = repositoryNameFld
                , status = statusFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "status" (Json.Decode.maybe lifecyclePolicyPreviewStatusDecoder) Nothing
                |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing
                |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
                |> Pipeline.optional
                    "lifecyclePolicyText"
                    (Json.Decode.maybe (Codec.decoder lifecyclePolicyTextCodec))
                    Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "StartLifecyclePolicyPreview" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Applies a repository policy on a specified repository to control access permissions. For more information, see `Amazon ECR Repository Policies` in the Amazon Elastic Container Registry User Guide.
-}
setRepositoryPolicy : SetRepositoryPolicyRequest -> AWS.Http.Request AWS.Http.AWSAppError SetRepositoryPolicyResponse
setRepositoryPolicy req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "policyText", val.policyText ) |> EncodeOpt.field (Codec.encoder repositoryPolicyTextCodec)
            , ( "force", val.force ) |> EncodeOpt.optionalField forceFlagEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\repositoryNameFld registryIdFld policyTextFld ->
                { policyText = policyTextFld, registryId = registryIdFld, repositoryName = repositoryNameFld }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing
                |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
                |> Pipeline.optional "policyText" (Json.Decode.maybe (Codec.decoder repositoryPolicyTextCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "SetRepositoryPolicy" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Creates or updates a lifecycle policy. For information about lifecycle policy syntax, see `Lifecycle Policy Template`.
-}
putLifecyclePolicy : PutLifecyclePolicyRequest -> AWS.Http.Request AWS.Http.AWSAppError PutLifecyclePolicyResponse
putLifecyclePolicy req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "lifecyclePolicyText", val.lifecyclePolicyText )
                |> EncodeOpt.field (Codec.encoder lifecyclePolicyTextCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\repositoryNameFld registryIdFld lifecyclePolicyTextFld ->
                { lifecyclePolicyText = lifecyclePolicyTextFld
                , registryId = registryIdFld
                , repositoryName = repositoryNameFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing
                |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
                |> Pipeline.optional
                    "lifecyclePolicyText"
                    (Json.Decode.maybe (Codec.decoder lifecyclePolicyTextCodec))
                    Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "PutLifecyclePolicy" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Updates the image tag mutability settings for a repository.
-}
putImageTagMutability : PutImageTagMutabilityRequest -> AWS.Http.Request AWS.Http.AWSAppError PutImageTagMutabilityResponse
putImageTagMutability req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "imageTagMutability", val.imageTagMutability )
                |> EncodeOpt.field (Codec.encoder imageTagMutabilityCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\repositoryNameFld registryIdFld imageTagMutabilityFld ->
                { imageTagMutability = imageTagMutabilityFld
                , registryId = registryIdFld
                , repositoryName = repositoryNameFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing
                |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
                |> Pipeline.optional
                    "imageTagMutability"
                    (Json.Decode.maybe (Codec.decoder imageTagMutabilityCodec))
                    Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "PutImageTagMutability" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Creates or updates the image manifest and tags associated with an image.

This operation is used by the Amazon ECR proxy, and it is not intended for general use by customers for pulling and pushing images. In most cases, you should use the `docker` CLI to pull, tag, and push images.

-}
putImage : PutImageRequest -> AWS.Http.Request AWS.Http.AWSAppError PutImageResponse
putImage req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "imageTag", val.imageTag ) |> EncodeOpt.optionalField (Codec.encoder imageTagCodec)
            , ( "imageManifest", val.imageManifest ) |> EncodeOpt.field (Codec.encoder imageManifestCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\imageFld -> { image = imageFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "image" (Json.Decode.maybe imageDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "PutImage" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| List the tags for an Amazon ECR resource.
-}
listTagsForResource : ListTagsForResourceRequest -> AWS.Http.Request AWS.Http.AWSAppError ListTagsForResourceResponse
listTagsForResource req =
    let
        encoder val =
            [ ( "resourceArn", val.resourceArn ) |> EncodeOpt.field (Codec.encoder arnCodec) ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\tagsFld -> { tags = tagsFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "tags" (Json.Decode.maybe (Codec.decoder tagListCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListTagsForResource" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Lists all the image IDs for a given repository.

You can filter images based on whether or not they are tagged by setting the `tagStatus` parameter to `TAGGED` or `UNTAGGED`. For example, you can filter your results to return only `UNTAGGED` images and then pipe that result to a `BatchDeleteImage` operation to delete them. Or, you can filter your results to return only `TAGGED` images to list all of the tags in your repository.

-}
listImages : ListImagesRequest -> AWS.Http.Request AWS.Http.AWSAppError ListImagesResponse
listImages req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "nextToken", val.nextToken ) |> EncodeOpt.optionalField (Codec.encoder nextTokenCodec)
            , ( "maxResults", val.maxResults ) |> EncodeOpt.optionalField maxResultsEncoder
            , ( "filter", val.filter ) |> EncodeOpt.optionalField listImagesFilterEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nextTokenFld imageIdsFld -> { imageIds = imageIdsFld, nextToken = nextTokenFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "nextToken" (Json.Decode.maybe (Codec.decoder nextTokenCodec)) Nothing
                |> Pipeline.optional "imageIds" (Json.Decode.maybe (Codec.decoder imageIdentifierListCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListImages" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Notify Amazon ECR that you intend to upload an image layer.

This operation is used by the Amazon ECR proxy, and it is not intended for general use by customers for pulling and pushing images. In most cases, you should use the `docker` CLI to pull, tag, and push images.

-}
initiateLayerUpload : InitiateLayerUploadRequest -> AWS.Http.Request AWS.Http.AWSAppError InitiateLayerUploadResponse
initiateLayerUpload req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\uploadIdFld partSizeFld -> { partSize = partSizeFld, uploadId = uploadIdFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "uploadId" (Json.Decode.maybe (Codec.decoder uploadIdCodec)) Nothing
                |> Pipeline.optional "partSize" (Json.Decode.maybe (Codec.decoder partSizeCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "InitiateLayerUpload" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Retrieves the repository policy for a specified repository.
-}
getRepositoryPolicy : GetRepositoryPolicyRequest -> AWS.Http.Request AWS.Http.AWSAppError GetRepositoryPolicyResponse
getRepositoryPolicy req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\repositoryNameFld registryIdFld policyTextFld ->
                { policyText = policyTextFld, registryId = registryIdFld, repositoryName = repositoryNameFld }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing
                |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
                |> Pipeline.optional "policyText" (Json.Decode.maybe (Codec.decoder repositoryPolicyTextCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "GetRepositoryPolicy" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Retrieves the results of the specified lifecycle policy preview request.
-}
getLifecyclePolicyPreview : GetLifecyclePolicyPreviewRequest -> AWS.Http.Request AWS.Http.AWSAppError GetLifecyclePolicyPreviewResponse
getLifecyclePolicyPreview req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "nextToken", val.nextToken ) |> EncodeOpt.optionalField (Codec.encoder nextTokenCodec)
            , ( "maxResults", val.maxResults ) |> EncodeOpt.optionalField lifecyclePreviewMaxResultsEncoder
            , ( "imageIds", val.imageIds ) |> EncodeOpt.optionalField (Codec.encoder imageIdentifierListCodec)
            , ( "filter", val.filter ) |> EncodeOpt.optionalField lifecyclePolicyPreviewFilterEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\summaryFld statusFld repositoryNameFld registryIdFld previewResultsFld nextTokenFld lifecyclePolicyTextFld ->
                { lifecyclePolicyText = lifecyclePolicyTextFld
                , nextToken = nextTokenFld
                , previewResults = previewResultsFld
                , registryId = registryIdFld
                , repositoryName = repositoryNameFld
                , status = statusFld
                , summary = summaryFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "summary" (Json.Decode.maybe lifecyclePolicyPreviewSummaryDecoder) Nothing
                |> Pipeline.optional "status" (Json.Decode.maybe lifecyclePolicyPreviewStatusDecoder) Nothing
                |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing
                |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
                |> Pipeline.optional
                    "previewResults"
                    (Json.Decode.maybe lifecyclePolicyPreviewResultListDecoder)
                    Nothing
                |> Pipeline.optional "nextToken" (Json.Decode.maybe (Codec.decoder nextTokenCodec)) Nothing
                |> Pipeline.optional
                    "lifecyclePolicyText"
                    (Json.Decode.maybe (Codec.decoder lifecyclePolicyTextCodec))
                    Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "GetLifecyclePolicyPreview" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Retrieves the specified lifecycle policy.
-}
getLifecyclePolicy : GetLifecyclePolicyRequest -> AWS.Http.Request AWS.Http.AWSAppError GetLifecyclePolicyResponse
getLifecyclePolicy req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\repositoryNameFld registryIdFld lifecyclePolicyTextFld lastEvaluatedAtFld ->
                { lastEvaluatedAt = lastEvaluatedAtFld
                , lifecyclePolicyText = lifecyclePolicyTextFld
                , registryId = registryIdFld
                , repositoryName = repositoryNameFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing
                |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
                |> Pipeline.optional
                    "lifecyclePolicyText"
                    (Json.Decode.maybe (Codec.decoder lifecyclePolicyTextCodec))
                    Nothing
                |> Pipeline.optional "lastEvaluatedAt" (Json.Decode.maybe evaluationTimestampDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "GetLifecyclePolicy" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Retrieves the pre-signed Amazon S3 download URL corresponding to an image layer. You can only get URLs for image layers that are referenced in an image.

This operation is used by the Amazon ECR proxy, and it is not intended for general use by customers for pulling and pushing images. In most cases, you should use the `docker` CLI to pull, tag, and push images.

-}
getDownloadUrlForLayer : GetDownloadUrlForLayerRequest -> AWS.Http.Request AWS.Http.AWSAppError GetDownloadUrlForLayerResponse
getDownloadUrlForLayer req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "layerDigest", val.layerDigest ) |> EncodeOpt.field (Codec.encoder layerDigestCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\layerDigestFld downloadUrlFld -> { downloadUrl = downloadUrlFld, layerDigest = layerDigestFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "layerDigest" (Json.Decode.maybe (Codec.decoder layerDigestCodec)) Nothing
                |> Pipeline.optional "downloadUrl" (Json.Decode.maybe urlDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "GetDownloadUrlForLayer" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Retrieves a token that is valid for a specified registry for 12 hours. This command allows you to use the `docker` CLI to push and pull images with Amazon ECR. If you do not specify a registry, the default registry is assumed.

The `authorizationToken` returned for each registry specified is a base64 encoded string that can be decoded and used in a `docker login` command to authenticate to a registry. The AWS CLI offers an `aws ecr get-login` command that simplifies the login process.

-}
getAuthorizationToken : GetAuthorizationTokenRequest -> AWS.Http.Request AWS.Http.AWSAppError GetAuthorizationTokenResponse
getAuthorizationToken req =
    let
        encoder val =
            [ ( "registryIds", val.registryIds ) |> EncodeOpt.optionalField getAuthorizationTokenRegistryIdListEncoder ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\authorizationDataFld -> { authorizationData = authorizationDataFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "authorizationData" (Json.Decode.maybe authorizationDataListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "GetAuthorizationToken" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Describes image repositories in a registry.
-}
describeRepositories : DescribeRepositoriesRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeRepositoriesResponse
describeRepositories req =
    let
        encoder val =
            [ ( "repositoryNames", val.repositoryNames ) |> EncodeOpt.optionalField repositoryNameListEncoder
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "nextToken", val.nextToken ) |> EncodeOpt.optionalField (Codec.encoder nextTokenCodec)
            , ( "maxResults", val.maxResults ) |> EncodeOpt.optionalField maxResultsEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\repositoriesFld nextTokenFld -> { nextToken = nextTokenFld, repositories = repositoriesFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "repositories" (Json.Decode.maybe repositoryListDecoder) Nothing
                |> Pipeline.optional "nextToken" (Json.Decode.maybe (Codec.decoder nextTokenCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeRepositories" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Returns metadata about the images in a repository, including image size, image tags, and creation date.

Beginning with Docker version 1.9, the Docker client compresses image layers before pushing them to a V2 Docker registry. The output of the `docker images` command shows the uncompressed image size, so it may return a larger image size than the image sizes returned by `DescribeImages`.

-}
describeImages : DescribeImagesRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeImagesResponse
describeImages req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "nextToken", val.nextToken ) |> EncodeOpt.optionalField (Codec.encoder nextTokenCodec)
            , ( "maxResults", val.maxResults ) |> EncodeOpt.optionalField maxResultsEncoder
            , ( "imageIds", val.imageIds ) |> EncodeOpt.optionalField (Codec.encoder imageIdentifierListCodec)
            , ( "filter", val.filter ) |> EncodeOpt.optionalField describeImagesFilterEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nextTokenFld imageDetailsFld -> { imageDetails = imageDetailsFld, nextToken = nextTokenFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "nextToken" (Json.Decode.maybe (Codec.decoder nextTokenCodec)) Nothing
                |> Pipeline.optional "imageDetails" (Json.Decode.maybe imageDetailListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeImages" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes the repository policy from a specified repository.
-}
deleteRepositoryPolicy : DeleteRepositoryPolicyRequest -> AWS.Http.Request AWS.Http.AWSAppError DeleteRepositoryPolicyResponse
deleteRepositoryPolicy req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\repositoryNameFld registryIdFld policyTextFld ->
                { policyText = policyTextFld, registryId = registryIdFld, repositoryName = repositoryNameFld }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing
                |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
                |> Pipeline.optional "policyText" (Json.Decode.maybe (Codec.decoder repositoryPolicyTextCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DeleteRepositoryPolicy" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes an existing image repository. If a repository contains images, you must use the `force` option to delete it.
-}
deleteRepository : DeleteRepositoryRequest -> AWS.Http.Request AWS.Http.AWSAppError DeleteRepositoryResponse
deleteRepository req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "force", val.force ) |> EncodeOpt.optionalField forceFlagEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\repositoryFld -> { repository = repositoryFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "repository" (Json.Decode.maybe repositoryDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DeleteRepository" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes the specified lifecycle policy.
-}
deleteLifecyclePolicy : DeleteLifecyclePolicyRequest -> AWS.Http.Request AWS.Http.AWSAppError DeleteLifecyclePolicyResponse
deleteLifecyclePolicy req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\repositoryNameFld registryIdFld lifecyclePolicyTextFld lastEvaluatedAtFld ->
                { lastEvaluatedAt = lastEvaluatedAtFld
                , lifecyclePolicyText = lifecyclePolicyTextFld
                , registryId = registryIdFld
                , repositoryName = repositoryNameFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing
                |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
                |> Pipeline.optional
                    "lifecyclePolicyText"
                    (Json.Decode.maybe (Codec.decoder lifecyclePolicyTextCodec))
                    Nothing
                |> Pipeline.optional "lastEvaluatedAt" (Json.Decode.maybe evaluationTimestampDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DeleteLifecyclePolicy" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Creates an image repository.
-}
createRepository : CreateRepositoryRequest -> AWS.Http.Request AWS.Http.AWSAppError CreateRepositoryResponse
createRepository req =
    let
        encoder val =
            [ ( "tags", val.tags ) |> EncodeOpt.optionalField (Codec.encoder tagListCodec)
            , ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "imageTagMutability", val.imageTagMutability )
                |> EncodeOpt.optionalField (Codec.encoder imageTagMutabilityCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\repositoryFld -> { repository = repositoryFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "repository" (Json.Decode.maybe repositoryDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CreateRepository" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Informs Amazon ECR that the image layer upload has completed for a specified registry, repository name, and upload ID. You can optionally provide a `sha256` digest of the image layer for data validation purposes.

This operation is used by the Amazon ECR proxy, and it is not intended for general use by customers for pulling and pushing images. In most cases, you should use the `docker` CLI to pull, tag, and push images.

-}
completeLayerUpload : CompleteLayerUploadRequest -> AWS.Http.Request AWS.Http.AWSAppError CompleteLayerUploadResponse
completeLayerUpload req =
    let
        encoder val =
            [ ( "uploadId", val.uploadId ) |> EncodeOpt.field (Codec.encoder uploadIdCodec)
            , ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "layerDigests", val.layerDigests ) |> EncodeOpt.field layerDigestListEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\uploadIdFld repositoryNameFld registryIdFld layerDigestFld ->
                { layerDigest = layerDigestFld
                , registryId = registryIdFld
                , repositoryName = repositoryNameFld
                , uploadId = uploadIdFld
                }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "uploadId" (Json.Decode.maybe (Codec.decoder uploadIdCodec)) Nothing
                |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing
                |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
                |> Pipeline.optional "layerDigest" (Json.Decode.maybe (Codec.decoder layerDigestCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CompleteLayerUpload" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Gets detailed information for specified images within a specified repository. Images are specified with either `imageTag` or `imageDigest`.
-}
batchGetImage : BatchGetImageRequest -> AWS.Http.Request AWS.Http.AWSAppError BatchGetImageResponse
batchGetImage req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "imageIds", val.imageIds ) |> EncodeOpt.field (Codec.encoder imageIdentifierListCodec)
            , ( "acceptedMediaTypes", val.acceptedMediaTypes ) |> EncodeOpt.optionalField mediaTypeListEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\imagesFld failuresFld -> { failures = failuresFld, images = imagesFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "images" (Json.Decode.maybe imageListDecoder) Nothing
                |> Pipeline.optional "failures" (Json.Decode.maybe imageFailureListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "BatchGetImage" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes a list of specified images within a specified repository. Images are specified with either `imageTag` or `imageDigest`.

You can remove a tag from an image by specifying the image's tag in your request. When you remove the last tag from an image, the image is deleted from your repository.

You can completely delete an image (and all of its tags) by specifying the image's digest in your request.

-}
batchDeleteImage : BatchDeleteImageRequest -> AWS.Http.Request AWS.Http.AWSAppError BatchDeleteImageResponse
batchDeleteImage req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "imageIds", val.imageIds ) |> EncodeOpt.field (Codec.encoder imageIdentifierListCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\imageIdsFld failuresFld -> { failures = failuresFld, imageIds = imageIdsFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "imageIds" (Json.Decode.maybe (Codec.decoder imageIdentifierListCodec)) Nothing
                |> Pipeline.optional "failures" (Json.Decode.maybe imageFailureListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "BatchDeleteImage" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Check the availability of multiple image layers in a specified registry and repository.

This operation is used by the Amazon ECR proxy, and it is not intended for general use by customers for pulling and pushing images. In most cases, you should use the `docker` CLI to pull, tag, and push images.

-}
batchCheckLayerAvailability : BatchCheckLayerAvailabilityRequest -> AWS.Http.Request AWS.Http.AWSAppError BatchCheckLayerAvailabilityResponse
batchCheckLayerAvailability req =
    let
        encoder val =
            [ ( "repositoryName", val.repositoryName ) |> EncodeOpt.field (Codec.encoder repositoryNameCodec)
            , ( "registryId", val.registryId ) |> EncodeOpt.optionalField (Codec.encoder registryIdCodec)
            , ( "layerDigests", val.layerDigests ) |> EncodeOpt.field batchedOperationLayerDigestListEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\layersFld failuresFld -> { failures = failuresFld, layers = layersFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "layers" (Json.Decode.maybe layerListDecoder) Nothing
                |> Pipeline.optional "failures" (Json.Decode.maybe layerFailureListDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "BatchCheckLayerAvailability" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| The Url data model.
-}
type alias Url =
    String


{-| The UploadLayerPartResponse data model.
-}
type alias UploadLayerPartResponse =
    { lastByteReceived : Maybe PartSize
    , registryId : Maybe RegistryId
    , repositoryName : Maybe RepositoryName
    , uploadId : Maybe UploadId
    }


{-| The UploadLayerPartRequest data model.
-}
type alias UploadLayerPartRequest =
    { layerPartBlob : LayerPartBlob
    , partFirstByte : PartSize
    , partLastByte : PartSize
    , registryId : Maybe RegistryId
    , repositoryName : RepositoryName
    , uploadId : UploadId
    }


{-| The UploadId data model.
-}
type alias UploadId =
    String


{-| The UntagResourceResponse data model.
-}
type alias UntagResourceResponse =
    {}


{-| The UntagResourceRequest data model.
-}
type alias UntagResourceRequest =
    { resourceArn : Arn, tagKeys : TagKeyList }


{-| The TagValue data model.
-}
type alias TagValue =
    String


{-| The TagStatus data model.
-}
type TagStatus
    = TagStatusTagged
    | TagStatusUntagged
    | TagStatusAny


{-| The TagStatus data model.
-}
tagStatus : Enum TagStatus
tagStatus =
    Enum.define
        [ TagStatusTagged, TagStatusUntagged, TagStatusAny ]
        (\val ->
            case val of
                TagStatusTagged ->
                    "TAGGED"

                TagStatusUntagged ->
                    "UNTAGGED"

                TagStatusAny ->
                    "ANY"
        )


{-| The TagResourceResponse data model.
-}
type alias TagResourceResponse =
    {}


{-| The TagResourceRequest data model.
-}
type alias TagResourceRequest =
    { resourceArn : Arn, tags : TagList }


{-| The TagList data model.
-}
type alias TagList =
    List Tag


{-| The TagKeyList data model.
-}
type alias TagKeyList =
    List TagKey


{-| The TagKey data model.
-}
type alias TagKey =
    String


{-| The Tag data model.
-}
type alias Tag =
    { key : Maybe TagKey, value : Maybe TagValue }


{-| The StartLifecyclePolicyPreviewResponse data model.
-}
type alias StartLifecyclePolicyPreviewResponse =
    { lifecyclePolicyText : Maybe LifecyclePolicyText
    , registryId : Maybe RegistryId
    , repositoryName : Maybe RepositoryName
    , status : Maybe LifecyclePolicyPreviewStatus
    }


{-| The StartLifecyclePolicyPreviewRequest data model.
-}
type alias StartLifecyclePolicyPreviewRequest =
    { lifecyclePolicyText : Maybe LifecyclePolicyText, registryId : Maybe RegistryId, repositoryName : RepositoryName }


{-| The SetRepositoryPolicyResponse data model.
-}
type alias SetRepositoryPolicyResponse =
    { policyText : Maybe RepositoryPolicyText, registryId : Maybe RegistryId, repositoryName : Maybe RepositoryName }


{-| The SetRepositoryPolicyRequest data model.
-}
type alias SetRepositoryPolicyRequest =
    { force : Maybe ForceFlag
    , policyText : RepositoryPolicyText
    , registryId : Maybe RegistryId
    , repositoryName : RepositoryName
    }


{-| The RepositoryPolicyText data model.
-}
type alias RepositoryPolicyText =
    String


{-| The RepositoryNameList data model.
-}
type alias RepositoryNameList =
    List RepositoryName


{-| The RepositoryName data model.
-}
type alias RepositoryName =
    String


{-| The RepositoryList data model.
-}
type alias RepositoryList =
    List Repository


{-| The Repository data model.
-}
type alias Repository =
    { createdAt : Maybe CreationTimestamp
    , imageTagMutability : Maybe ImageTagMutability
    , registryId : Maybe RegistryId
    , repositoryArn : Maybe Arn
    , repositoryName : Maybe RepositoryName
    , repositoryUri : Maybe Url
    }


{-| The RegistryId data model.
-}
type alias RegistryId =
    String


{-| The PutLifecyclePolicyResponse data model.
-}
type alias PutLifecyclePolicyResponse =
    { lifecyclePolicyText : Maybe LifecyclePolicyText
    , registryId : Maybe RegistryId
    , repositoryName : Maybe RepositoryName
    }


{-| The PutLifecyclePolicyRequest data model.
-}
type alias PutLifecyclePolicyRequest =
    { lifecyclePolicyText : LifecyclePolicyText, registryId : Maybe RegistryId, repositoryName : RepositoryName }


{-| The PutImageTagMutabilityResponse data model.
-}
type alias PutImageTagMutabilityResponse =
    { imageTagMutability : Maybe ImageTagMutability
    , registryId : Maybe RegistryId
    , repositoryName : Maybe RepositoryName
    }


{-| The PutImageTagMutabilityRequest data model.
-}
type alias PutImageTagMutabilityRequest =
    { imageTagMutability : ImageTagMutability, registryId : Maybe RegistryId, repositoryName : RepositoryName }


{-| The PutImageResponse data model.
-}
type alias PutImageResponse =
    { image : Maybe Image }


{-| The PutImageRequest data model.
-}
type alias PutImageRequest =
    { imageManifest : ImageManifest
    , imageTag : Maybe ImageTag
    , registryId : Maybe RegistryId
    , repositoryName : RepositoryName
    }


{-| The PushTimestamp data model.
-}
type alias PushTimestamp =
    String


{-| The ProxyEndpoint data model.
-}
type alias ProxyEndpoint =
    String


{-| The PartSize data model.
-}
type alias PartSize =
    Int


{-| The NextToken data model.
-}
type alias NextToken =
    String


{-| The MediaTypeList data model.
-}
type alias MediaTypeList =
    List MediaType


{-| The MediaType data model.
-}
type alias MediaType =
    String


{-| The MaxResults data model.
-}
type alias MaxResults =
    Int


{-| The ListTagsForResourceResponse data model.
-}
type alias ListTagsForResourceResponse =
    { tags : Maybe TagList }


{-| The ListTagsForResourceRequest data model.
-}
type alias ListTagsForResourceRequest =
    { resourceArn : Arn }


{-| The ListImagesResponse data model.
-}
type alias ListImagesResponse =
    { imageIds : Maybe ImageIdentifierList, nextToken : Maybe NextToken }


{-| The ListImagesRequest data model.
-}
type alias ListImagesRequest =
    { filter : Maybe ListImagesFilter
    , maxResults : Maybe MaxResults
    , nextToken : Maybe NextToken
    , registryId : Maybe RegistryId
    , repositoryName : RepositoryName
    }


{-| The ListImagesFilter data model.
-}
type alias ListImagesFilter =
    { tagStatus : Maybe TagStatus }


{-| The LifecyclePreviewMaxResults data model.
-}
type alias LifecyclePreviewMaxResults =
    Int


{-| The LifecyclePolicyText data model.
-}
type alias LifecyclePolicyText =
    String


{-| The LifecyclePolicyRulePriority data model.
-}
type alias LifecyclePolicyRulePriority =
    Int


{-| The LifecyclePolicyRuleAction data model.
-}
type alias LifecyclePolicyRuleAction =
    { type_ : Maybe ImageActionType }


{-| The LifecyclePolicyPreviewSummary data model.
-}
type alias LifecyclePolicyPreviewSummary =
    { expiringImageTotalCount : Maybe ImageCount }


{-| The LifecyclePolicyPreviewStatus data model.
-}
type LifecyclePolicyPreviewStatus
    = LifecyclePolicyPreviewStatusInProgress
    | LifecyclePolicyPreviewStatusComplete
    | LifecyclePolicyPreviewStatusExpired
    | LifecyclePolicyPreviewStatusFailed


{-| The LifecyclePolicyPreviewStatus data model.
-}
lifecyclePolicyPreviewStatus : Enum LifecyclePolicyPreviewStatus
lifecyclePolicyPreviewStatus =
    Enum.define
        [ LifecyclePolicyPreviewStatusInProgress
        , LifecyclePolicyPreviewStatusComplete
        , LifecyclePolicyPreviewStatusExpired
        , LifecyclePolicyPreviewStatusFailed
        ]
        (\val ->
            case val of
                LifecyclePolicyPreviewStatusInProgress ->
                    "IN_PROGRESS"

                LifecyclePolicyPreviewStatusComplete ->
                    "COMPLETE"

                LifecyclePolicyPreviewStatusExpired ->
                    "EXPIRED"

                LifecyclePolicyPreviewStatusFailed ->
                    "FAILED"
        )


{-| The LifecyclePolicyPreviewResultList data model.
-}
type alias LifecyclePolicyPreviewResultList =
    List LifecyclePolicyPreviewResult


{-| The LifecyclePolicyPreviewResult data model.
-}
type alias LifecyclePolicyPreviewResult =
    { action : Maybe LifecyclePolicyRuleAction
    , appliedRulePriority : Maybe LifecyclePolicyRulePriority
    , imageDigest : Maybe ImageDigest
    , imagePushedAt : Maybe PushTimestamp
    , imageTags : Maybe ImageTagList
    }


{-| The LifecyclePolicyPreviewFilter data model.
-}
type alias LifecyclePolicyPreviewFilter =
    { tagStatus : Maybe TagStatus }


{-| The LayerSizeInBytes data model.
-}
type alias LayerSizeInBytes =
    Int


{-| The LayerPartBlob data model.
-}
type alias LayerPartBlob =
    String


{-| The LayerList data model.
-}
type alias LayerList =
    List Layer


{-| The LayerFailureReason data model.
-}
type alias LayerFailureReason =
    String


{-| The LayerFailureList data model.
-}
type alias LayerFailureList =
    List LayerFailure


{-| The LayerFailureCode data model.
-}
type LayerFailureCode
    = LayerFailureCodeInvalidLayerDigest
    | LayerFailureCodeMissingLayerDigest


{-| The LayerFailureCode data model.
-}
layerFailureCode : Enum LayerFailureCode
layerFailureCode =
    Enum.define
        [ LayerFailureCodeInvalidLayerDigest, LayerFailureCodeMissingLayerDigest ]
        (\val ->
            case val of
                LayerFailureCodeInvalidLayerDigest ->
                    "InvalidLayerDigest"

                LayerFailureCodeMissingLayerDigest ->
                    "MissingLayerDigest"
        )


{-| The LayerFailure data model.
-}
type alias LayerFailure =
    { failureCode : Maybe LayerFailureCode
    , failureReason : Maybe LayerFailureReason
    , layerDigest : Maybe BatchedOperationLayerDigest
    }


{-| The LayerDigestList data model.
-}
type alias LayerDigestList =
    List LayerDigest


{-| The LayerDigest data model.
-}
type alias LayerDigest =
    String


{-| The LayerAvailability data model.
-}
type LayerAvailability
    = LayerAvailabilityAvailable
    | LayerAvailabilityUnavailable


{-| The LayerAvailability data model.
-}
layerAvailability : Enum LayerAvailability
layerAvailability =
    Enum.define
        [ LayerAvailabilityAvailable, LayerAvailabilityUnavailable ]
        (\val ->
            case val of
                LayerAvailabilityAvailable ->
                    "AVAILABLE"

                LayerAvailabilityUnavailable ->
                    "UNAVAILABLE"
        )


{-| The Layer data model.
-}
type alias Layer =
    { layerAvailability : Maybe LayerAvailability
    , layerDigest : Maybe LayerDigest
    , layerSize : Maybe LayerSizeInBytes
    , mediaType : Maybe MediaType
    }


{-| The InitiateLayerUploadResponse data model.
-}
type alias InitiateLayerUploadResponse =
    { partSize : Maybe PartSize, uploadId : Maybe UploadId }


{-| The InitiateLayerUploadRequest data model.
-}
type alias InitiateLayerUploadRequest =
    { registryId : Maybe RegistryId, repositoryName : RepositoryName }


{-| The ImageTagMutability data model.
-}
type ImageTagMutability
    = ImageTagMutabilityMutable
    | ImageTagMutabilityImmutable


{-| The ImageTagMutability data model.
-}
imageTagMutability : Enum ImageTagMutability
imageTagMutability =
    Enum.define
        [ ImageTagMutabilityMutable, ImageTagMutabilityImmutable ]
        (\val ->
            case val of
                ImageTagMutabilityMutable ->
                    "MUTABLE"

                ImageTagMutabilityImmutable ->
                    "IMMUTABLE"
        )


{-| The ImageTagList data model.
-}
type alias ImageTagList =
    List ImageTag


{-| The ImageTag data model.
-}
type alias ImageTag =
    String


{-| The ImageSizeInBytes data model.
-}
type alias ImageSizeInBytes =
    Int


{-| The ImageManifest data model.
-}
type alias ImageManifest =
    String


{-| The ImageList data model.
-}
type alias ImageList =
    List Image


{-| The ImageIdentifierList data model.
-}
type alias ImageIdentifierList =
    List ImageIdentifier


{-| The ImageIdentifier data model.
-}
type alias ImageIdentifier =
    { imageDigest : Maybe ImageDigest, imageTag : Maybe ImageTag }


{-| The ImageFailureReason data model.
-}
type alias ImageFailureReason =
    String


{-| The ImageFailureList data model.
-}
type alias ImageFailureList =
    List ImageFailure


{-| The ImageFailureCode data model.
-}
type ImageFailureCode
    = ImageFailureCodeInvalidImageDigest
    | ImageFailureCodeInvalidImageTag
    | ImageFailureCodeImageTagDoesNotMatchDigest
    | ImageFailureCodeImageNotFound
    | ImageFailureCodeMissingDigestAndTag


{-| The ImageFailureCode data model.
-}
imageFailureCode : Enum ImageFailureCode
imageFailureCode =
    Enum.define
        [ ImageFailureCodeInvalidImageDigest
        , ImageFailureCodeInvalidImageTag
        , ImageFailureCodeImageTagDoesNotMatchDigest
        , ImageFailureCodeImageNotFound
        , ImageFailureCodeMissingDigestAndTag
        ]
        (\val ->
            case val of
                ImageFailureCodeInvalidImageDigest ->
                    "InvalidImageDigest"

                ImageFailureCodeInvalidImageTag ->
                    "InvalidImageTag"

                ImageFailureCodeImageTagDoesNotMatchDigest ->
                    "ImageTagDoesNotMatchDigest"

                ImageFailureCodeImageNotFound ->
                    "ImageNotFound"

                ImageFailureCodeMissingDigestAndTag ->
                    "MissingDigestAndTag"
        )


{-| The ImageFailure data model.
-}
type alias ImageFailure =
    { failureCode : Maybe ImageFailureCode, failureReason : Maybe ImageFailureReason, imageId : Maybe ImageIdentifier }


{-| The ImageDigest data model.
-}
type alias ImageDigest =
    String


{-| The ImageDetailList data model.
-}
type alias ImageDetailList =
    List ImageDetail


{-| The ImageDetail data model.
-}
type alias ImageDetail =
    { imageDigest : Maybe ImageDigest
    , imagePushedAt : Maybe PushTimestamp
    , imageSizeInBytes : Maybe ImageSizeInBytes
    , imageTags : Maybe ImageTagList
    , registryId : Maybe RegistryId
    , repositoryName : Maybe RepositoryName
    }


{-| The ImageCount data model.
-}
type alias ImageCount =
    Int


{-| The ImageActionType data model.
-}
type ImageActionType
    = ImageActionTypeExpire


{-| The ImageActionType data model.
-}
imageActionType : Enum ImageActionType
imageActionType =
    Enum.define
        [ ImageActionTypeExpire ]
        (\val ->
            case val of
                ImageActionTypeExpire ->
                    "EXPIRE"
        )


{-| The Image data model.
-}
type alias Image =
    { imageId : Maybe ImageIdentifier
    , imageManifest : Maybe ImageManifest
    , registryId : Maybe RegistryId
    , repositoryName : Maybe RepositoryName
    }


{-| The GetRepositoryPolicyResponse data model.
-}
type alias GetRepositoryPolicyResponse =
    { policyText : Maybe RepositoryPolicyText, registryId : Maybe RegistryId, repositoryName : Maybe RepositoryName }


{-| The GetRepositoryPolicyRequest data model.
-}
type alias GetRepositoryPolicyRequest =
    { registryId : Maybe RegistryId, repositoryName : RepositoryName }


{-| The GetLifecyclePolicyResponse data model.
-}
type alias GetLifecyclePolicyResponse =
    { lastEvaluatedAt : Maybe EvaluationTimestamp
    , lifecyclePolicyText : Maybe LifecyclePolicyText
    , registryId : Maybe RegistryId
    , repositoryName : Maybe RepositoryName
    }


{-| The GetLifecyclePolicyRequest data model.
-}
type alias GetLifecyclePolicyRequest =
    { registryId : Maybe RegistryId, repositoryName : RepositoryName }


{-| The GetLifecyclePolicyPreviewResponse data model.
-}
type alias GetLifecyclePolicyPreviewResponse =
    { lifecyclePolicyText : Maybe LifecyclePolicyText
    , nextToken : Maybe NextToken
    , previewResults : Maybe LifecyclePolicyPreviewResultList
    , registryId : Maybe RegistryId
    , repositoryName : Maybe RepositoryName
    , status : Maybe LifecyclePolicyPreviewStatus
    , summary : Maybe LifecyclePolicyPreviewSummary
    }


{-| The GetLifecyclePolicyPreviewRequest data model.
-}
type alias GetLifecyclePolicyPreviewRequest =
    { filter : Maybe LifecyclePolicyPreviewFilter
    , imageIds : Maybe ImageIdentifierList
    , maxResults : Maybe LifecyclePreviewMaxResults
    , nextToken : Maybe NextToken
    , registryId : Maybe RegistryId
    , repositoryName : RepositoryName
    }


{-| The GetDownloadUrlForLayerResponse data model.
-}
type alias GetDownloadUrlForLayerResponse =
    { downloadUrl : Maybe Url, layerDigest : Maybe LayerDigest }


{-| The GetDownloadUrlForLayerRequest data model.
-}
type alias GetDownloadUrlForLayerRequest =
    { layerDigest : LayerDigest, registryId : Maybe RegistryId, repositoryName : RepositoryName }


{-| The GetAuthorizationTokenResponse data model.
-}
type alias GetAuthorizationTokenResponse =
    { authorizationData : Maybe AuthorizationDataList }


{-| The GetAuthorizationTokenRequest data model.
-}
type alias GetAuthorizationTokenRequest =
    { registryIds : Maybe GetAuthorizationTokenRegistryIdList }


{-| The GetAuthorizationTokenRegistryIdList data model.
-}
type alias GetAuthorizationTokenRegistryIdList =
    List RegistryId


{-| The ForceFlag data model.
-}
type alias ForceFlag =
    Bool


{-| The ExpirationTimestamp data model.
-}
type alias ExpirationTimestamp =
    String


{-| The EvaluationTimestamp data model.
-}
type alias EvaluationTimestamp =
    String


{-| The DescribeRepositoriesResponse data model.
-}
type alias DescribeRepositoriesResponse =
    { nextToken : Maybe NextToken, repositories : Maybe RepositoryList }


{-| The DescribeRepositoriesRequest data model.
-}
type alias DescribeRepositoriesRequest =
    { maxResults : Maybe MaxResults
    , nextToken : Maybe NextToken
    , registryId : Maybe RegistryId
    , repositoryNames : Maybe RepositoryNameList
    }


{-| The DescribeImagesResponse data model.
-}
type alias DescribeImagesResponse =
    { imageDetails : Maybe ImageDetailList, nextToken : Maybe NextToken }


{-| The DescribeImagesRequest data model.
-}
type alias DescribeImagesRequest =
    { filter : Maybe DescribeImagesFilter
    , imageIds : Maybe ImageIdentifierList
    , maxResults : Maybe MaxResults
    , nextToken : Maybe NextToken
    , registryId : Maybe RegistryId
    , repositoryName : RepositoryName
    }


{-| The DescribeImagesFilter data model.
-}
type alias DescribeImagesFilter =
    { tagStatus : Maybe TagStatus }


{-| The DeleteRepositoryResponse data model.
-}
type alias DeleteRepositoryResponse =
    { repository : Maybe Repository }


{-| The DeleteRepositoryRequest data model.
-}
type alias DeleteRepositoryRequest =
    { force : Maybe ForceFlag, registryId : Maybe RegistryId, repositoryName : RepositoryName }


{-| The DeleteRepositoryPolicyResponse data model.
-}
type alias DeleteRepositoryPolicyResponse =
    { policyText : Maybe RepositoryPolicyText, registryId : Maybe RegistryId, repositoryName : Maybe RepositoryName }


{-| The DeleteRepositoryPolicyRequest data model.
-}
type alias DeleteRepositoryPolicyRequest =
    { registryId : Maybe RegistryId, repositoryName : RepositoryName }


{-| The DeleteLifecyclePolicyResponse data model.
-}
type alias DeleteLifecyclePolicyResponse =
    { lastEvaluatedAt : Maybe EvaluationTimestamp
    , lifecyclePolicyText : Maybe LifecyclePolicyText
    , registryId : Maybe RegistryId
    , repositoryName : Maybe RepositoryName
    }


{-| The DeleteLifecyclePolicyRequest data model.
-}
type alias DeleteLifecyclePolicyRequest =
    { registryId : Maybe RegistryId, repositoryName : RepositoryName }


{-| The CreationTimestamp data model.
-}
type alias CreationTimestamp =
    String


{-| The CreateRepositoryResponse data model.
-}
type alias CreateRepositoryResponse =
    { repository : Maybe Repository }


{-| The CreateRepositoryRequest data model.
-}
type alias CreateRepositoryRequest =
    { imageTagMutability : Maybe ImageTagMutability, repositoryName : RepositoryName, tags : Maybe TagList }


{-| The CompleteLayerUploadResponse data model.
-}
type alias CompleteLayerUploadResponse =
    { layerDigest : Maybe LayerDigest
    , registryId : Maybe RegistryId
    , repositoryName : Maybe RepositoryName
    , uploadId : Maybe UploadId
    }


{-| The CompleteLayerUploadRequest data model.
-}
type alias CompleteLayerUploadRequest =
    { layerDigests : LayerDigestList
    , registryId : Maybe RegistryId
    , repositoryName : RepositoryName
    , uploadId : UploadId
    }


{-| The BatchedOperationLayerDigestList data model.
-}
type alias BatchedOperationLayerDigestList =
    List BatchedOperationLayerDigest


{-| The BatchedOperationLayerDigest data model.
-}
type alias BatchedOperationLayerDigest =
    String


{-| The BatchGetImageResponse data model.
-}
type alias BatchGetImageResponse =
    { failures : Maybe ImageFailureList, images : Maybe ImageList }


{-| The BatchGetImageRequest data model.
-}
type alias BatchGetImageRequest =
    { acceptedMediaTypes : Maybe MediaTypeList
    , imageIds : ImageIdentifierList
    , registryId : Maybe RegistryId
    , repositoryName : RepositoryName
    }


{-| The BatchDeleteImageResponse data model.
-}
type alias BatchDeleteImageResponse =
    { failures : Maybe ImageFailureList, imageIds : Maybe ImageIdentifierList }


{-| The BatchDeleteImageRequest data model.
-}
type alias BatchDeleteImageRequest =
    { imageIds : ImageIdentifierList, registryId : Maybe RegistryId, repositoryName : RepositoryName }


{-| The BatchCheckLayerAvailabilityResponse data model.
-}
type alias BatchCheckLayerAvailabilityResponse =
    { failures : Maybe LayerFailureList, layers : Maybe LayerList }


{-| The BatchCheckLayerAvailabilityRequest data model.
-}
type alias BatchCheckLayerAvailabilityRequest =
    { layerDigests : BatchedOperationLayerDigestList, registryId : Maybe RegistryId, repositoryName : RepositoryName }


{-| The Base64 data model.
-}
type alias Base64 =
    String


{-| The AuthorizationDataList data model.
-}
type alias AuthorizationDataList =
    List AuthorizationData


{-| The AuthorizationData data model.
-}
type alias AuthorizationData =
    { authorizationToken : Maybe Base64, expiresAt : Maybe ExpirationTimestamp, proxyEndpoint : Maybe ProxyEndpoint }


{-| The Arn data model.
-}
type alias Arn =
    String


{-| Codec for Arn.
-}
arnCodec : Codec Arn
arnCodec =
    Codec.string


{-| Decoder for AuthorizationData.
-}
authorizationDataDecoder : Decoder AuthorizationData
authorizationDataDecoder =
    Json.Decode.succeed AuthorizationData
        |> Pipeline.optional "authorizationToken" (Json.Decode.maybe base64Decoder) Nothing
        |> Pipeline.optional "expiresAt" (Json.Decode.maybe expirationTimestampDecoder) Nothing
        |> Pipeline.optional "proxyEndpoint" (Json.Decode.maybe proxyEndpointDecoder) Nothing


{-| Decoder for AuthorizationDataList.
-}
authorizationDataListDecoder : Decoder AuthorizationDataList
authorizationDataListDecoder =
    Json.Decode.list authorizationDataDecoder


{-| Decoder for Base64.
-}
base64Decoder : Decoder Base64
base64Decoder =
    Json.Decode.string


{-| Codec for BatchedOperationLayerDigest.
-}
batchedOperationLayerDigestCodec : Codec BatchedOperationLayerDigest
batchedOperationLayerDigestCodec =
    Codec.string


{-| Encoder for BatchedOperationLayerDigestList.
-}
batchedOperationLayerDigestListEncoder : BatchedOperationLayerDigestList -> Value
batchedOperationLayerDigestListEncoder val =
    Json.Encode.list (Codec.encoder batchedOperationLayerDigestCodec) val


{-| Decoder for CreationTimestamp.
-}
creationTimestampDecoder : Decoder CreationTimestamp
creationTimestampDecoder =
    Json.Decode.string


{-| Encoder for DescribeImagesFilter.
-}
describeImagesFilterEncoder : DescribeImagesFilter -> Value
describeImagesFilterEncoder val =
    [ ( "tagStatus", val.tagStatus ) |> EncodeOpt.optionalField tagStatusEncoder ] |> EncodeOpt.objectMaySkip


{-| Decoder for EvaluationTimestamp.
-}
evaluationTimestampDecoder : Decoder EvaluationTimestamp
evaluationTimestampDecoder =
    Json.Decode.string


{-| Decoder for ExpirationTimestamp.
-}
expirationTimestampDecoder : Decoder ExpirationTimestamp
expirationTimestampDecoder =
    Json.Decode.string


{-| Encoder for ForceFlag.
-}
forceFlagEncoder : ForceFlag -> Value
forceFlagEncoder val =
    Json.Encode.bool val


{-| Encoder for GetAuthorizationTokenRegistryIdList.
-}
getAuthorizationTokenRegistryIdListEncoder : GetAuthorizationTokenRegistryIdList -> Value
getAuthorizationTokenRegistryIdListEncoder val =
    Json.Encode.list (Codec.encoder registryIdCodec) val


{-| Decoder for Image.
-}
imageDecoder : Decoder Image
imageDecoder =
    Json.Decode.succeed Image
        |> Pipeline.optional "imageId" (Json.Decode.maybe (Codec.decoder imageIdentifierCodec)) Nothing
        |> Pipeline.optional "imageManifest" (Json.Decode.maybe (Codec.decoder imageManifestCodec)) Nothing
        |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
        |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing


{-| Decoder for ImageActionType.
-}
imageActionTypeDecoder : Decoder ImageActionType
imageActionTypeDecoder =
    Enum.decoder imageActionType


{-| Decoder for ImageCount.
-}
imageCountDecoder : Decoder ImageCount
imageCountDecoder =
    Json.Decode.int


{-| Decoder for ImageDetail.
-}
imageDetailDecoder : Decoder ImageDetail
imageDetailDecoder =
    Json.Decode.succeed ImageDetail
        |> Pipeline.optional "imageDigest" (Json.Decode.maybe (Codec.decoder imageDigestCodec)) Nothing
        |> Pipeline.optional "imagePushedAt" (Json.Decode.maybe pushTimestampDecoder) Nothing
        |> Pipeline.optional "imageSizeInBytes" (Json.Decode.maybe imageSizeInBytesDecoder) Nothing
        |> Pipeline.optional "imageTags" (Json.Decode.maybe imageTagListDecoder) Nothing
        |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
        |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing


{-| Decoder for ImageDetailList.
-}
imageDetailListDecoder : Decoder ImageDetailList
imageDetailListDecoder =
    Json.Decode.list imageDetailDecoder


{-| Codec for ImageDigest.
-}
imageDigestCodec : Codec ImageDigest
imageDigestCodec =
    Codec.string


{-| Decoder for ImageFailure.
-}
imageFailureDecoder : Decoder ImageFailure
imageFailureDecoder =
    Json.Decode.succeed ImageFailure
        |> Pipeline.optional "failureCode" (Json.Decode.maybe imageFailureCodeDecoder) Nothing
        |> Pipeline.optional "failureReason" (Json.Decode.maybe imageFailureReasonDecoder) Nothing
        |> Pipeline.optional "imageId" (Json.Decode.maybe (Codec.decoder imageIdentifierCodec)) Nothing


{-| Decoder for ImageFailureCode.
-}
imageFailureCodeDecoder : Decoder ImageFailureCode
imageFailureCodeDecoder =
    Enum.decoder imageFailureCode


{-| Decoder for ImageFailureList.
-}
imageFailureListDecoder : Decoder ImageFailureList
imageFailureListDecoder =
    Json.Decode.list imageFailureDecoder


{-| Decoder for ImageFailureReason.
-}
imageFailureReasonDecoder : Decoder ImageFailureReason
imageFailureReasonDecoder =
    Json.Decode.string


{-| Codec for ImageIdentifier.
-}
imageIdentifierCodec : Codec ImageIdentifier
imageIdentifierCodec =
    Codec.object ImageIdentifier
        |> Codec.optionalField "imageDigest" .imageDigest imageDigestCodec
        |> Codec.optionalField "imageTag" .imageTag imageTagCodec
        |> Codec.buildObject


{-| Codec for ImageIdentifierList.
-}
imageIdentifierListCodec : Codec ImageIdentifierList
imageIdentifierListCodec =
    Codec.list imageIdentifierCodec


{-| Decoder for ImageList.
-}
imageListDecoder : Decoder ImageList
imageListDecoder =
    Json.Decode.list imageDecoder


{-| Codec for ImageManifest.
-}
imageManifestCodec : Codec ImageManifest
imageManifestCodec =
    Codec.string


{-| Decoder for ImageSizeInBytes.
-}
imageSizeInBytesDecoder : Decoder ImageSizeInBytes
imageSizeInBytesDecoder =
    Json.Decode.int


{-| Codec for ImageTag.
-}
imageTagCodec : Codec ImageTag
imageTagCodec =
    Codec.string


{-| Decoder for ImageTagList.
-}
imageTagListDecoder : Decoder ImageTagList
imageTagListDecoder =
    Json.Decode.list (Codec.decoder imageTagCodec)


{-| Codec for ImageTagMutability.
-}
imageTagMutabilityCodec : Codec ImageTagMutability
imageTagMutabilityCodec =
    Codec.build (Enum.encoder imageTagMutability) (Enum.decoder imageTagMutability)


{-| Decoder for Layer.
-}
layerDecoder : Decoder Layer
layerDecoder =
    Json.Decode.succeed Layer
        |> Pipeline.optional "layerAvailability" (Json.Decode.maybe layerAvailabilityDecoder) Nothing
        |> Pipeline.optional "layerDigest" (Json.Decode.maybe (Codec.decoder layerDigestCodec)) Nothing
        |> Pipeline.optional "layerSize" (Json.Decode.maybe layerSizeInBytesDecoder) Nothing
        |> Pipeline.optional "mediaType" (Json.Decode.maybe (Codec.decoder mediaTypeCodec)) Nothing


{-| Decoder for LayerAvailability.
-}
layerAvailabilityDecoder : Decoder LayerAvailability
layerAvailabilityDecoder =
    Enum.decoder layerAvailability


{-| Codec for LayerDigest.
-}
layerDigestCodec : Codec LayerDigest
layerDigestCodec =
    Codec.string


{-| Encoder for LayerDigestList.
-}
layerDigestListEncoder : LayerDigestList -> Value
layerDigestListEncoder val =
    Json.Encode.list (Codec.encoder layerDigestCodec) val


{-| Decoder for LayerFailure.
-}
layerFailureDecoder : Decoder LayerFailure
layerFailureDecoder =
    Json.Decode.succeed LayerFailure
        |> Pipeline.optional "failureCode" (Json.Decode.maybe layerFailureCodeDecoder) Nothing
        |> Pipeline.optional "failureReason" (Json.Decode.maybe layerFailureReasonDecoder) Nothing
        |> Pipeline.optional "layerDigest" (Json.Decode.maybe (Codec.decoder batchedOperationLayerDigestCodec)) Nothing


{-| Decoder for LayerFailureCode.
-}
layerFailureCodeDecoder : Decoder LayerFailureCode
layerFailureCodeDecoder =
    Enum.decoder layerFailureCode


{-| Decoder for LayerFailureList.
-}
layerFailureListDecoder : Decoder LayerFailureList
layerFailureListDecoder =
    Json.Decode.list layerFailureDecoder


{-| Decoder for LayerFailureReason.
-}
layerFailureReasonDecoder : Decoder LayerFailureReason
layerFailureReasonDecoder =
    Json.Decode.string


{-| Decoder for LayerList.
-}
layerListDecoder : Decoder LayerList
layerListDecoder =
    Json.Decode.list layerDecoder


{-| Encoder for LayerPartBlob.
-}
layerPartBlobEncoder : LayerPartBlob -> Value
layerPartBlobEncoder val =
    Json.Encode.string val


{-| Decoder for LayerSizeInBytes.
-}
layerSizeInBytesDecoder : Decoder LayerSizeInBytes
layerSizeInBytesDecoder =
    Json.Decode.int


{-| Encoder for LifecyclePolicyPreviewFilter.
-}
lifecyclePolicyPreviewFilterEncoder : LifecyclePolicyPreviewFilter -> Value
lifecyclePolicyPreviewFilterEncoder val =
    [ ( "tagStatus", val.tagStatus ) |> EncodeOpt.optionalField tagStatusEncoder ] |> EncodeOpt.objectMaySkip


{-| Decoder for LifecyclePolicyPreviewResult.
-}
lifecyclePolicyPreviewResultDecoder : Decoder LifecyclePolicyPreviewResult
lifecyclePolicyPreviewResultDecoder =
    Json.Decode.succeed LifecyclePolicyPreviewResult
        |> Pipeline.optional "action" (Json.Decode.maybe lifecyclePolicyRuleActionDecoder) Nothing
        |> Pipeline.optional "appliedRulePriority" (Json.Decode.maybe lifecyclePolicyRulePriorityDecoder) Nothing
        |> Pipeline.optional "imageDigest" (Json.Decode.maybe (Codec.decoder imageDigestCodec)) Nothing
        |> Pipeline.optional "imagePushedAt" (Json.Decode.maybe pushTimestampDecoder) Nothing
        |> Pipeline.optional "imageTags" (Json.Decode.maybe imageTagListDecoder) Nothing


{-| Decoder for LifecyclePolicyPreviewResultList.
-}
lifecyclePolicyPreviewResultListDecoder : Decoder LifecyclePolicyPreviewResultList
lifecyclePolicyPreviewResultListDecoder =
    Json.Decode.list lifecyclePolicyPreviewResultDecoder


{-| Decoder for LifecyclePolicyPreviewStatus.
-}
lifecyclePolicyPreviewStatusDecoder : Decoder LifecyclePolicyPreviewStatus
lifecyclePolicyPreviewStatusDecoder =
    Enum.decoder lifecyclePolicyPreviewStatus


{-| Decoder for LifecyclePolicyPreviewSummary.
-}
lifecyclePolicyPreviewSummaryDecoder : Decoder LifecyclePolicyPreviewSummary
lifecyclePolicyPreviewSummaryDecoder =
    Json.Decode.succeed LifecyclePolicyPreviewSummary
        |> Pipeline.optional "expiringImageTotalCount" (Json.Decode.maybe imageCountDecoder) Nothing


{-| Decoder for LifecyclePolicyRuleAction.
-}
lifecyclePolicyRuleActionDecoder : Decoder LifecyclePolicyRuleAction
lifecyclePolicyRuleActionDecoder =
    Json.Decode.succeed LifecyclePolicyRuleAction
        |> Pipeline.optional "type" (Json.Decode.maybe imageActionTypeDecoder) Nothing


{-| Decoder for LifecyclePolicyRulePriority.
-}
lifecyclePolicyRulePriorityDecoder : Decoder LifecyclePolicyRulePriority
lifecyclePolicyRulePriorityDecoder =
    Json.Decode.int


{-| Codec for LifecyclePolicyText.
-}
lifecyclePolicyTextCodec : Codec LifecyclePolicyText
lifecyclePolicyTextCodec =
    Codec.string


{-| Encoder for LifecyclePreviewMaxResults.
-}
lifecyclePreviewMaxResultsEncoder : LifecyclePreviewMaxResults -> Value
lifecyclePreviewMaxResultsEncoder val =
    Json.Encode.int val


{-| Encoder for ListImagesFilter.
-}
listImagesFilterEncoder : ListImagesFilter -> Value
listImagesFilterEncoder val =
    [ ( "tagStatus", val.tagStatus ) |> EncodeOpt.optionalField tagStatusEncoder ] |> EncodeOpt.objectMaySkip


{-| Encoder for MaxResults.
-}
maxResultsEncoder : MaxResults -> Value
maxResultsEncoder val =
    Json.Encode.int val


{-| Codec for MediaType.
-}
mediaTypeCodec : Codec MediaType
mediaTypeCodec =
    Codec.string


{-| Encoder for MediaTypeList.
-}
mediaTypeListEncoder : MediaTypeList -> Value
mediaTypeListEncoder val =
    Json.Encode.list (Codec.encoder mediaTypeCodec) val


{-| Codec for NextToken.
-}
nextTokenCodec : Codec NextToken
nextTokenCodec =
    Codec.string


{-| Codec for PartSize.
-}
partSizeCodec : Codec PartSize
partSizeCodec =
    Codec.int


{-| Decoder for ProxyEndpoint.
-}
proxyEndpointDecoder : Decoder ProxyEndpoint
proxyEndpointDecoder =
    Json.Decode.string


{-| Decoder for PushTimestamp.
-}
pushTimestampDecoder : Decoder PushTimestamp
pushTimestampDecoder =
    Json.Decode.string


{-| Codec for RegistryId.
-}
registryIdCodec : Codec RegistryId
registryIdCodec =
    Codec.string


{-| Decoder for Repository.
-}
repositoryDecoder : Decoder Repository
repositoryDecoder =
    Json.Decode.succeed Repository
        |> Pipeline.optional "createdAt" (Json.Decode.maybe creationTimestampDecoder) Nothing
        |> Pipeline.optional "imageTagMutability" (Json.Decode.maybe (Codec.decoder imageTagMutabilityCodec)) Nothing
        |> Pipeline.optional "registryId" (Json.Decode.maybe (Codec.decoder registryIdCodec)) Nothing
        |> Pipeline.optional "repositoryArn" (Json.Decode.maybe (Codec.decoder arnCodec)) Nothing
        |> Pipeline.optional "repositoryName" (Json.Decode.maybe (Codec.decoder repositoryNameCodec)) Nothing
        |> Pipeline.optional "repositoryUri" (Json.Decode.maybe urlDecoder) Nothing


{-| Decoder for RepositoryList.
-}
repositoryListDecoder : Decoder RepositoryList
repositoryListDecoder =
    Json.Decode.list repositoryDecoder


{-| Codec for RepositoryName.
-}
repositoryNameCodec : Codec RepositoryName
repositoryNameCodec =
    Codec.string


{-| Encoder for RepositoryNameList.
-}
repositoryNameListEncoder : RepositoryNameList -> Value
repositoryNameListEncoder val =
    Json.Encode.list (Codec.encoder repositoryNameCodec) val


{-| Codec for RepositoryPolicyText.
-}
repositoryPolicyTextCodec : Codec RepositoryPolicyText
repositoryPolicyTextCodec =
    Codec.string


{-| Codec for Tag.
-}
tagCodec : Codec Tag
tagCodec =
    Codec.object Tag
        |> Codec.optionalField "Key" .key tagKeyCodec
        |> Codec.optionalField "Value" .value tagValueCodec
        |> Codec.buildObject


{-| Codec for TagKey.
-}
tagKeyCodec : Codec TagKey
tagKeyCodec =
    Codec.string


{-| Encoder for TagKeyList.
-}
tagKeyListEncoder : TagKeyList -> Value
tagKeyListEncoder val =
    Json.Encode.list (Codec.encoder tagKeyCodec) val


{-| Codec for TagList.
-}
tagListCodec : Codec TagList
tagListCodec =
    Codec.list tagCodec


{-| Encoder for TagStatus.
-}
tagStatusEncoder : TagStatus -> Value
tagStatusEncoder =
    Enum.encoder tagStatus


{-| Codec for TagValue.
-}
tagValueCodec : Codec TagValue
tagValueCodec =
    Codec.string


{-| Codec for UploadId.
-}
uploadIdCodec : Codec UploadId
uploadIdCodec =
    Codec.string


{-| Decoder for Url.
-}
urlDecoder : Decoder Url
urlDecoder =
    Json.Decode.string
