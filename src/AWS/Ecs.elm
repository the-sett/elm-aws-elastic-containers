module AWS.Ecs exposing
    ( service
    , createCluster, createService, createTaskSet, deleteAccountSetting, deleteAttributes, deleteCluster, deleteService, deleteTaskSet
    , deregisterContainerInstance, deregisterTaskDefinition, describeClusters, describeContainerInstances, describeServices
    , describeTaskDefinition, describeTaskSets, describeTasks, discoverPollEndpoint, listAccountSettings, listAttributes, listClusters
    , listContainerInstances, listServices, listTagsForResource, listTaskDefinitionFamilies, listTaskDefinitions, listTasks
    , putAccountSetting, putAccountSettingDefault, putAttributes, registerContainerInstance, registerTaskDefinition, runTask, startTask
    , stopTask, submitAttachmentStateChanges, submitContainerStateChange, submitTaskStateChange, tagResource, untagResource
    , updateContainerAgent, updateContainerInstancesState, updateService, updateServicePrimaryTaskSet, updateTaskSet
    , AgentUpdateStatus(..), AssignPublicIp(..), Attachment, AttachmentDetails, AttachmentStateChange, AttachmentStateChanges, Attachments
    , Attribute, Attributes, AwsVpcConfiguration, Boolean, BoxedBoolean, BoxedInteger, Cluster, ClusterField(..), ClusterFieldList, ClusterSetting
    , ClusterSettingName(..), ClusterSettings, Clusters, Compatibility(..), CompatibilityList, Connectivity(..), Container, ContainerCondition(..)
    , ContainerDefinition, ContainerDefinitions, ContainerDependencies, ContainerDependency, ContainerInstance, ContainerInstanceField(..)
    , ContainerInstanceFieldList, ContainerInstanceStatus(..), ContainerInstances, ContainerOverride, ContainerOverrides
    , ContainerStateChange, ContainerStateChanges, Containers, CreateClusterRequest, CreateClusterResponse, CreateServiceRequest
    , CreateServiceResponse, CreateTaskSetRequest, CreateTaskSetResponse, DeleteAccountSettingRequest, DeleteAccountSettingResponse
    , DeleteAttributesRequest, DeleteAttributesResponse, DeleteClusterRequest, DeleteClusterResponse, DeleteServiceRequest
    , DeleteServiceResponse, DeleteTaskSetRequest, DeleteTaskSetResponse, Deployment, DeploymentConfiguration, DeploymentController
    , DeploymentControllerType(..), Deployments, DeregisterContainerInstanceRequest, DeregisterContainerInstanceResponse
    , DeregisterTaskDefinitionRequest, DeregisterTaskDefinitionResponse, DescribeClustersRequest, DescribeClustersResponse
    , DescribeContainerInstancesRequest, DescribeContainerInstancesResponse, DescribeServicesRequest, DescribeServicesResponse
    , DescribeTaskDefinitionRequest, DescribeTaskDefinitionResponse, DescribeTaskSetsRequest, DescribeTaskSetsResponse
    , DescribeTasksRequest, DescribeTasksResponse, DesiredStatus(..), Device, DeviceCgroupPermission(..), DeviceCgroupPermissions, DevicesList
    , DiscoverPollEndpointRequest, DiscoverPollEndpointResponse, DockerLabelsMap, DockerVolumeConfiguration, Double
    , EnvironmentVariables, Failure, Failures, GpuIds, HealthCheck, HealthStatus(..), HostEntry, HostEntryList, HostVolumeProperties, Integer, IpcMode(..)
    , KernelCapabilities, KeyValuePair, LaunchType(..), LinuxParameters, ListAccountSettingsRequest, ListAccountSettingsResponse
    , ListAttributesRequest, ListAttributesResponse, ListClustersRequest, ListClustersResponse, ListContainerInstancesRequest
    , ListContainerInstancesResponse, ListServicesRequest, ListServicesResponse, ListTagsForResourceRequest
    , ListTagsForResourceResponse, ListTaskDefinitionFamiliesRequest, ListTaskDefinitionFamiliesResponse, ListTaskDefinitionsRequest
    , ListTaskDefinitionsResponse, ListTasksRequest, ListTasksResponse, LoadBalancer, LoadBalancers, LogConfiguration
    , LogConfigurationOptionsMap, LogDriver(..), Long, MountPoint, MountPointList, NetworkBinding, NetworkBindings, NetworkConfiguration
    , NetworkInterface, NetworkInterfaces, NetworkMode(..), PidMode(..), PlacementConstraint, PlacementConstraintType(..), PlacementConstraints
    , PlacementStrategies, PlacementStrategy, PlacementStrategyType(..), PlatformDevice, PlatformDeviceType(..), PlatformDevices, PortMapping
    , PortMappingList, PropagateTags(..), ProxyConfiguration, ProxyConfigurationProperties, ProxyConfigurationType(..)
    , PutAccountSettingDefaultRequest, PutAccountSettingDefaultResponse, PutAccountSettingRequest, PutAccountSettingResponse
    , PutAttributesRequest, PutAttributesResponse, RegisterContainerInstanceRequest, RegisterContainerInstanceResponse
    , RegisterTaskDefinitionRequest, RegisterTaskDefinitionResponse, RepositoryCredentials, RequiresAttributes, Resource
    , ResourceRequirement, ResourceRequirements, ResourceType(..), Resources, RunTaskRequest, RunTaskResponse, Scale, ScaleUnit(..)
    , SchedulingStrategy(..), Scope(..), Secret, SecretList, Service, ServiceEvent, ServiceEvents, ServiceField(..), ServiceFieldList, ServiceRegistries
    , ServiceRegistry, Services, Setting, SettingName(..), Settings, SortOrder(..), StabilityStatus(..), StartTaskRequest, StartTaskResponse, Statistics
    , StopTaskRequest, StopTaskResponse, StringList, StringMap, String_, SubmitAttachmentStateChangesRequest
    , SubmitAttachmentStateChangesResponse, SubmitContainerStateChangeRequest, SubmitContainerStateChangeResponse
    , SubmitTaskStateChangeRequest, SubmitTaskStateChangeResponse, SystemControl, SystemControls, Tag, TagKey, TagKeys, TagResourceRequest
    , TagResourceResponse, TagValue, Tags, TargetType(..), Task, TaskDefinition, TaskDefinitionFamilyStatus(..), TaskDefinitionField(..)
    , TaskDefinitionFieldList, TaskDefinitionPlacementConstraint, TaskDefinitionPlacementConstraintType(..)
    , TaskDefinitionPlacementConstraints, TaskDefinitionStatus(..), TaskField(..), TaskFieldList, TaskOverride, TaskSet, TaskSets, TaskStopCode(..), Tasks
    , Timestamp, Tmpfs, TmpfsList, TransportProtocol(..), Ulimit, UlimitList, UlimitName(..), UntagResourceRequest, UntagResourceResponse
    , UpdateContainerAgentRequest, UpdateContainerAgentResponse, UpdateContainerInstancesStateRequest
    , UpdateContainerInstancesStateResponse, UpdateServicePrimaryTaskSetRequest, UpdateServicePrimaryTaskSetResponse
    , UpdateServiceRequest, UpdateServiceResponse, UpdateTaskSetRequest, UpdateTaskSetResponse, VersionInfo, Volume, VolumeFrom
    , VolumeFromList, VolumeList, agentUpdateStatus, assignPublicIp, clusterField, clusterSettingName, compatibility, connectivity
    , containerCondition, containerInstanceField, containerInstanceStatus, deploymentControllerType, desiredStatus
    , deviceCgroupPermission, healthStatus, ipcMode, launchType, logDriver, networkMode, pidMode, placementConstraintType
    , placementStrategyType, platformDeviceType, propagateTags, proxyConfigurationType, resourceType, scaleUnit, schedulingStrategy, scope
    , serviceField, settingName, sortOrder, stabilityStatus, targetType, taskDefinitionFamilyStatus, taskDefinitionField
    , taskDefinitionPlacementConstraintType, taskDefinitionStatus, taskField, taskStopCode, transportProtocol, ulimitName
    )

{-|


## Amazon Elastic Container Service

Amazon Elastic Container Service (Amazon ECS) is a highly scalable, fast, container management service that makes it easy to run, stop, and manage Docker containers on a cluster. You can host your cluster on a serverless infrastructure that is managed by Amazon ECS by launching your services or tasks using the Fargate launch type. For more control, you can host your tasks on a cluster of Amazon Elastic Compute Cloud (Amazon EC2) instances that you manage by using the EC2 launch type. For more information about launch types, see `Amazon ECS Launch Types`.

Amazon ECS lets you launch and stop container-based applications with simple API calls, allows you to get the state of your cluster from a centralized service, and gives you access to many familiar Amazon EC2 features.

You can use Amazon ECS to schedule the placement of containers across your cluster based on your resource needs, isolation policies, and availability requirements. Amazon ECS eliminates the need for you to operate your own cluster management and configuration management systems or worry about scaling your management infrastructure.


# Service definition.

@docs service


# Service endpoints.

@docs createCluster, createService, createTaskSet, deleteAccountSetting, deleteAttributes, deleteCluster, deleteService, deleteTaskSet
@docs deregisterContainerInstance, deregisterTaskDefinition, describeClusters, describeContainerInstances, describeServices
@docs describeTaskDefinition, describeTaskSets, describeTasks, discoverPollEndpoint, listAccountSettings, listAttributes, listClusters
@docs listContainerInstances, listServices, listTagsForResource, listTaskDefinitionFamilies, listTaskDefinitions, listTasks
@docs putAccountSetting, putAccountSettingDefault, putAttributes, registerContainerInstance, registerTaskDefinition, runTask, startTask
@docs stopTask, submitAttachmentStateChanges, submitContainerStateChange, submitTaskStateChange, tagResource, untagResource
@docs updateContainerAgent, updateContainerInstancesState, updateService, updateServicePrimaryTaskSet, updateTaskSet


# API data model.

@docs AgentUpdateStatus, AssignPublicIp, Attachment, AttachmentDetails, AttachmentStateChange, AttachmentStateChanges, Attachments
@docs Attribute, Attributes, AwsVpcConfiguration, Boolean, BoxedBoolean, BoxedInteger, Cluster, ClusterField, ClusterFieldList, ClusterSetting
@docs ClusterSettingName, ClusterSettings, Clusters, Compatibility, CompatibilityList, Connectivity, Container, ContainerCondition
@docs ContainerDefinition, ContainerDefinitions, ContainerDependencies, ContainerDependency, ContainerInstance, ContainerInstanceField
@docs ContainerInstanceFieldList, ContainerInstanceStatus, ContainerInstances, ContainerOverride, ContainerOverrides
@docs ContainerStateChange, ContainerStateChanges, Containers, CreateClusterRequest, CreateClusterResponse, CreateServiceRequest
@docs CreateServiceResponse, CreateTaskSetRequest, CreateTaskSetResponse, DeleteAccountSettingRequest, DeleteAccountSettingResponse
@docs DeleteAttributesRequest, DeleteAttributesResponse, DeleteClusterRequest, DeleteClusterResponse, DeleteServiceRequest
@docs DeleteServiceResponse, DeleteTaskSetRequest, DeleteTaskSetResponse, Deployment, DeploymentConfiguration, DeploymentController
@docs DeploymentControllerType, Deployments, DeregisterContainerInstanceRequest, DeregisterContainerInstanceResponse
@docs DeregisterTaskDefinitionRequest, DeregisterTaskDefinitionResponse, DescribeClustersRequest, DescribeClustersResponse
@docs DescribeContainerInstancesRequest, DescribeContainerInstancesResponse, DescribeServicesRequest, DescribeServicesResponse
@docs DescribeTaskDefinitionRequest, DescribeTaskDefinitionResponse, DescribeTaskSetsRequest, DescribeTaskSetsResponse
@docs DescribeTasksRequest, DescribeTasksResponse, DesiredStatus, Device, DeviceCgroupPermission, DeviceCgroupPermissions, DevicesList
@docs DiscoverPollEndpointRequest, DiscoverPollEndpointResponse, DockerLabelsMap, DockerVolumeConfiguration, Double
@docs EnvironmentVariables, Failure, Failures, GpuIds, HealthCheck, HealthStatus, HostEntry, HostEntryList, HostVolumeProperties, Integer, IpcMode
@docs KernelCapabilities, KeyValuePair, LaunchType, LinuxParameters, ListAccountSettingsRequest, ListAccountSettingsResponse
@docs ListAttributesRequest, ListAttributesResponse, ListClustersRequest, ListClustersResponse, ListContainerInstancesRequest
@docs ListContainerInstancesResponse, ListServicesRequest, ListServicesResponse, ListTagsForResourceRequest
@docs ListTagsForResourceResponse, ListTaskDefinitionFamiliesRequest, ListTaskDefinitionFamiliesResponse, ListTaskDefinitionsRequest
@docs ListTaskDefinitionsResponse, ListTasksRequest, ListTasksResponse, LoadBalancer, LoadBalancers, LogConfiguration
@docs LogConfigurationOptionsMap, LogDriver, Long, MountPoint, MountPointList, NetworkBinding, NetworkBindings, NetworkConfiguration
@docs NetworkInterface, NetworkInterfaces, NetworkMode, PidMode, PlacementConstraint, PlacementConstraintType, PlacementConstraints
@docs PlacementStrategies, PlacementStrategy, PlacementStrategyType, PlatformDevice, PlatformDeviceType, PlatformDevices, PortMapping
@docs PortMappingList, PropagateTags, ProxyConfiguration, ProxyConfigurationProperties, ProxyConfigurationType
@docs PutAccountSettingDefaultRequest, PutAccountSettingDefaultResponse, PutAccountSettingRequest, PutAccountSettingResponse
@docs PutAttributesRequest, PutAttributesResponse, RegisterContainerInstanceRequest, RegisterContainerInstanceResponse
@docs RegisterTaskDefinitionRequest, RegisterTaskDefinitionResponse, RepositoryCredentials, RequiresAttributes, Resource
@docs ResourceRequirement, ResourceRequirements, ResourceType, Resources, RunTaskRequest, RunTaskResponse, Scale, ScaleUnit
@docs SchedulingStrategy, Scope, Secret, SecretList, Service, ServiceEvent, ServiceEvents, ServiceField, ServiceFieldList, ServiceRegistries
@docs ServiceRegistry, Services, Setting, SettingName, Settings, SortOrder, StabilityStatus, StartTaskRequest, StartTaskResponse, Statistics
@docs StopTaskRequest, StopTaskResponse, StringList, StringMap, String_, SubmitAttachmentStateChangesRequest
@docs SubmitAttachmentStateChangesResponse, SubmitContainerStateChangeRequest, SubmitContainerStateChangeResponse
@docs SubmitTaskStateChangeRequest, SubmitTaskStateChangeResponse, SystemControl, SystemControls, Tag, TagKey, TagKeys, TagResourceRequest
@docs TagResourceResponse, TagValue, Tags, TargetType, Task, TaskDefinition, TaskDefinitionFamilyStatus, TaskDefinitionField
@docs TaskDefinitionFieldList, TaskDefinitionPlacementConstraint, TaskDefinitionPlacementConstraintType
@docs TaskDefinitionPlacementConstraints, TaskDefinitionStatus, TaskField, TaskFieldList, TaskOverride, TaskSet, TaskSets, TaskStopCode, Tasks
@docs Timestamp, Tmpfs, TmpfsList, TransportProtocol, Ulimit, UlimitList, UlimitName, UntagResourceRequest, UntagResourceResponse
@docs UpdateContainerAgentRequest, UpdateContainerAgentResponse, UpdateContainerInstancesStateRequest
@docs UpdateContainerInstancesStateResponse, UpdateServicePrimaryTaskSetRequest, UpdateServicePrimaryTaskSetResponse
@docs UpdateServiceRequest, UpdateServiceResponse, UpdateTaskSetRequest, UpdateTaskSetResponse, VersionInfo, Volume, VolumeFrom
@docs VolumeFromList, VolumeList, agentUpdateStatus, assignPublicIp, clusterField, clusterSettingName, compatibility, connectivity
@docs containerCondition, containerInstanceField, containerInstanceStatus, deploymentControllerType, desiredStatus
@docs deviceCgroupPermission, healthStatus, ipcMode, launchType, logDriver, networkMode, pidMode, placementConstraintType
@docs placementStrategyType, platformDeviceType, propagateTags, proxyConfigurationType, resourceType, scaleUnit, schedulingStrategy, scope
@docs serviceField, settingName, sortOrder, stabilityStatus, targetType, taskDefinitionFamilyStatus, taskDefinitionField
@docs taskDefinitionPlacementConstraintType, taskDefinitionStatus, taskField, taskStopCode, transportProtocol, ulimitName

-}

import AWS.Config
import AWS.Http
import AWS.KVDecode exposing (KVDecoder)
import AWS.Service
import Codec exposing (Codec)
import Dict exposing (Dict)
import Enum exposing (Enum)
import Json.Decode exposing (Decoder, Value)
import Json.Decode.Pipeline as Pipeline
import Json.Encode exposing (Value)
import Json.Encode.Optional as EncodeOpt


{-| Configuration for this service.
-}
service : AWS.Config.Region -> AWS.Service.Service
service region =
    AWS.Config.defineRegional "ecs" "2014-11-13" AWS.Config.JSON AWS.Config.SignV4 region
        |> AWS.Config.withJsonVersion "1.1"
        |> AWS.Config.withTargetPrefix "AmazonEC2ContainerServiceV20141113"
        |> AWS.Service.service


{-| Modifies a task set. This is used when a service uses the `EXTERNAL` deployment controller type. For more information, see `Amazon ECS Deployment Types` in the Amazon Elastic Container Service Developer Guide.
-}
updateTaskSet : UpdateTaskSetRequest -> AWS.Http.Request AWS.Http.AWSAppError UpdateTaskSetResponse
updateTaskSet req =
    let
        encoder val =
            [ ( "taskSet", val.taskSet ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "service", val.service ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "scale", val.scale ) |> EncodeOpt.field (Codec.encoder scaleCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.field (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\taskSetFld -> { taskSet = taskSetFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "taskSet" (Json.Decode.maybe taskSetDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "UpdateTaskSet" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Modifies which task set in a service is the primary task set. Any parameters that are updated on the primary task set in a service will transition to the service. This is used when a service uses the `EXTERNAL` deployment controller type. For more information, see `Amazon ECS Deployment Types` in the Amazon Elastic Container Service Developer Guide.
-}
updateServicePrimaryTaskSet : UpdateServicePrimaryTaskSetRequest -> AWS.Http.Request AWS.Http.AWSAppError UpdateServicePrimaryTaskSetResponse
updateServicePrimaryTaskSet req =
    let
        encoder val =
            [ ( "service", val.service ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "primaryTaskSet", val.primaryTaskSet ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.field (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\taskSetFld -> { taskSet = taskSetFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "taskSet" (Json.Decode.maybe taskSetDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "UpdateServicePrimaryTaskSet" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Modifies the parameters of a service.

For services using the rolling update (`ECS`) deployment controller, the desired count, deployment configuration, network configuration, or task definition used can be updated.

For services using the blue/green (`CODE_DEPLOY`) deployment controller, only the desired count, deployment configuration, and health check grace period can be updated using this API. If the network configuration, platform version, or task definition need to be updated, a new AWS CodeDeploy deployment should be created. For more information, see `CreateDeployment` in the AWS CodeDeploy API Reference.

For services using an external deployment controller, you can update only the desired count and health check grace period using this API. If the launch type, load balancer, network configuration, platform version, or task definition need to be updated, you should create a new task set. For more information, see `CreateTaskSet`.

You can add to or subtract from the number of instantiations of a task definition in a service by specifying the cluster that the service is running in and a new `desiredCount` parameter.

If you have updated the Docker image of your application, you can create a new task definition with that image and deploy it to your service. The service scheduler uses the minimum healthy percent and maximum percent parameters (in the service's deployment configuration) to determine the deployment strategy.

If your updated Docker image uses the same tag as what is in the existing task definition for your service (for example, `my_image:latest`), you do not need to create a new revision of your task definition. You can update the service using the `forceNewDeployment` option. The new tasks launched by the deployment pull the current image/tag combination from your repository when they start.

You can also update the deployment configuration of a service. When a deployment is triggered by updating the task definition of a service, the service scheduler uses the deployment configuration parameters, `minimumHealthyPercent` and `maximumPercent`, to determine the deployment strategy.

  - If `minimumHealthyPercent` is below 100%, the scheduler can ignore `desiredCount` temporarily during a deployment. For example, if `desiredCount` is four tasks, a minimum of 50% allows the scheduler to stop two existing tasks before starting two new tasks. Tasks for services that do not use a load balancer are considered healthy if they are in the `RUNNING` state. Tasks for services that use a load balancer are considered healthy if they are in the `RUNNING` state and the container instance they are hosted on is reported as healthy by the load balancer. The `maximumPercent` parameter represents an upper limit on the number of running tasks during a deployment, which enables you to define the deployment batch size. For example, if `desiredCount` is four tasks, a maximum of 200% starts four new tasks before stopping the four older tasks (provided that the cluster resources required to do this are available).

When `UpdateService` stops a task during a deployment, the equivalent of `docker stop` is issued to the containers running in the task. This results in a `SIGTERM` and a 30-second timeout, after which `SIGKILL` is sent and the containers are forcibly stopped. If the container handles the `SIGTERM` gracefully and exits within 30 seconds from receiving it, no `SIGKILL` is sent.

When the service scheduler launches new tasks, it determines task placement in your cluster with the following logic:

  - Determine which of the container instances in your cluster can support your service's task definition (for example, they have the required CPU, memory, ports, and container instance attributes). By default, the service scheduler attempts to balance tasks across Availability Zones in this manner (although you can choose a different placement strategy): Sort the valid container instances by the fewest number of running tasks for this service in the same Availability Zone as the instance. For example, if zone A has one running service task and zones B and C each have zero, valid container instances in either zone B or C are considered optimal for placement. Place the new service task on a valid container instance in an optimal Availability Zone (based on the previous steps), favoring container instances with the fewest number of running tasks for this service.

When the service scheduler stops running tasks, it attempts to maintain balance across the Availability Zones in your cluster using the following logic:

  - Sort the container instances by the largest number of running tasks for this service in the same Availability Zone as the instance. For example, if zone A has one running service task and zones B and C each have two, container instances in either zone B or C are considered optimal for termination. Stop the task on a container instance in an optimal Availability Zone (based on the previous steps), favoring container instances with the largest number of running tasks for this service.

-}
updateService : UpdateServiceRequest -> AWS.Http.Request AWS.Http.AWSAppError UpdateServiceResponse
updateService req =
    let
        encoder val =
            [ ( "taskDefinition", val.taskDefinition ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "service", val.service ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "platformVersion", val.platformVersion ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "networkConfiguration", val.networkConfiguration )
                |> EncodeOpt.optionalField (Codec.encoder networkConfigurationCodec)
            , ( "healthCheckGracePeriodSeconds", val.healthCheckGracePeriodSeconds )
                |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
            , ( "forceNewDeployment", val.forceNewDeployment ) |> EncodeOpt.optionalField (Codec.encoder booleanCodec)
            , ( "desiredCount", val.desiredCount ) |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
            , ( "deploymentConfiguration", val.deploymentConfiguration )
                |> EncodeOpt.optionalField (Codec.encoder deploymentConfigurationCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\serviceFld -> { service = serviceFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "service" (Json.Decode.maybe serviceDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "UpdateService" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Modifies the status of an Amazon ECS container instance.

Once a container instance has reached an `ACTIVE` state, you can change the status of a container instance to `DRAINING` to manually remove an instance from a cluster, for example to perform system updates, update the Docker daemon, or scale down the cluster size.

A container instance cannot be changed to `DRAINING` until it has reached an `ACTIVE` status. If the instance is in any other status, an error will be received.

When you set a container instance to `DRAINING`, Amazon ECS prevents new tasks from being scheduled for placement on the container instance and replacement service tasks are started on other container instances in the cluster if the resources are available. Service tasks on the container instance that are in the `PENDING` state are stopped immediately.

Service tasks on the container instance that are in the `RUNNING` state are stopped and replaced according to the service's deployment configuration parameters, `minimumHealthyPercent` and `maximumPercent`. You can change the deployment configuration of your service using `UpdateService`.

  - If `minimumHealthyPercent` is below 100%, the scheduler can ignore `desiredCount` temporarily during task replacement. For example, `desiredCount` is four tasks, a minimum of 50% allows the scheduler to stop two existing tasks before starting two new tasks. If the minimum is 100%, the service scheduler can't remove existing tasks until the replacement tasks are considered healthy. Tasks for services that do not use a load balancer are considered healthy if they are in the `RUNNING` state. Tasks for services that use a load balancer are considered healthy if they are in the `RUNNING` state and the container instance they are hosted on is reported as healthy by the load balancer. The `maximumPercent` parameter represents an upper limit on the number of running tasks during task replacement, which enables you to define the replacement batch size. For example, if `desiredCount` is four tasks, a maximum of 200% starts four new tasks before stopping the four tasks to be drained, provided that the cluster resources required to do this are available. If the maximum is 100%, then replacement tasks can't start until the draining tasks have stopped.

Any `PENDING` or `RUNNING` tasks that do not belong to a service are not affected. You must wait for them to finish or stop them manually.

A container instance has completed draining when it has no more `RUNNING` tasks. You can verify this using `ListTasks`.

When a container instance has been drained, you can set a container instance to `ACTIVE` status and once it has reached that status the Amazon ECS scheduler can begin scheduling tasks on the instance again.

-}
updateContainerInstancesState : UpdateContainerInstancesStateRequest -> AWS.Http.Request AWS.Http.AWSAppError UpdateContainerInstancesStateResponse
updateContainerInstancesState req =
    let
        encoder val =
            [ ( "status", val.status ) |> EncodeOpt.field containerInstanceStatusEncoder
            , ( "containerInstances", val.containerInstances ) |> EncodeOpt.field (Codec.encoder stringListCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\failuresFld containerInstancesFld ->
                { containerInstances = containerInstancesFld, failures = failuresFld }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "failures" (Json.Decode.maybe failuresDecoder) Nothing
                |> Pipeline.optional "containerInstances" (Json.Decode.maybe containerInstancesDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "UpdateContainerInstancesState" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Updates the Amazon ECS container agent on a specified container instance. Updating the Amazon ECS container agent does not interrupt running tasks or services on the container instance. The process for updating the agent differs depending on whether your container instance was launched with the Amazon ECS-optimized AMI or another operating system.

`UpdateContainerAgent` requires the Amazon ECS-optimized AMI or Amazon Linux with the `ecs-init` service installed and running. For help updating the Amazon ECS container agent on other operating systems, see `Manually Updating the Amazon ECS Container Agent` in the Amazon Elastic Container Service Developer Guide.

-}
updateContainerAgent : UpdateContainerAgentRequest -> AWS.Http.Request AWS.Http.AWSAppError UpdateContainerAgentResponse
updateContainerAgent req =
    let
        encoder val =
            [ ( "containerInstance", val.containerInstance ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\containerInstanceFld -> { containerInstance = containerInstanceFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "containerInstance" (Json.Decode.maybe containerInstanceDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "UpdateContainerAgent" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes specified tags from a resource.
-}
untagResource : UntagResourceRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
untagResource req =
    let
        encoder val =
            [ ( "tagKeys", val.tagKeys ) |> EncodeOpt.field tagKeysEncoder
            , ( "resourceArn", val.resourceArn ) |> EncodeOpt.field (Codec.encoder stringCodec)
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


{-| Associates the specified tags to a resource with the specified `resourceArn`. If existing tags on a resource are not specified in the request parameters, they are not changed. When a resource is deleted, the tags associated with that resource are deleted as well.
-}
tagResource : TagResourceRequest -> AWS.Http.Request AWS.Http.AWSAppError ()
tagResource req =
    let
        encoder val =
            [ ( "tags", val.tags ) |> EncodeOpt.field (Codec.encoder tagsCodec)
            , ( "resourceArn", val.resourceArn ) |> EncodeOpt.field (Codec.encoder stringCodec)
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


{-| This action is only used by the Amazon ECS agent, and it is not intended for use outside of the agent.

Sent to acknowledge that a task changed states.

-}
submitTaskStateChange : SubmitTaskStateChangeRequest -> AWS.Http.Request AWS.Http.AWSAppError SubmitTaskStateChangeResponse
submitTaskStateChange req =
    let
        encoder val =
            [ ( "task", val.task ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "status", val.status ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "reason", val.reason ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "pullStoppedAt", val.pullStoppedAt ) |> EncodeOpt.optionalField (Codec.encoder timestampCodec)
            , ( "pullStartedAt", val.pullStartedAt ) |> EncodeOpt.optionalField (Codec.encoder timestampCodec)
            , ( "executionStoppedAt", val.executionStoppedAt ) |> EncodeOpt.optionalField (Codec.encoder timestampCodec)
            , ( "containers", val.containers ) |> EncodeOpt.optionalField containerStateChangesEncoder
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "attachments", val.attachments ) |> EncodeOpt.optionalField attachmentStateChangesEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\acknowledgmentFld -> { acknowledgment = acknowledgmentFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "acknowledgment" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "SubmitTaskStateChange" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| This action is only used by the Amazon ECS agent, and it is not intended for use outside of the agent.

Sent to acknowledge that a container changed states.

-}
submitContainerStateChange : SubmitContainerStateChangeRequest -> AWS.Http.Request AWS.Http.AWSAppError SubmitContainerStateChangeResponse
submitContainerStateChange req =
    let
        encoder val =
            [ ( "task", val.task ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "status", val.status ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "reason", val.reason ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "networkBindings", val.networkBindings ) |> EncodeOpt.optionalField (Codec.encoder networkBindingsCodec)
            , ( "exitCode", val.exitCode ) |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
            , ( "containerName", val.containerName ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\acknowledgmentFld -> { acknowledgment = acknowledgmentFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "acknowledgment" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "SubmitContainerStateChange" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| This action is only used by the Amazon ECS agent, and it is not intended for use outside of the agent.

Sent to acknowledge that an attachment changed states.

-}
submitAttachmentStateChanges : SubmitAttachmentStateChangesRequest -> AWS.Http.Request AWS.Http.AWSAppError SubmitAttachmentStateChangesResponse
submitAttachmentStateChanges req =
    let
        encoder val =
            [ ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "attachments", val.attachments ) |> EncodeOpt.field attachmentStateChangesEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\acknowledgmentFld -> { acknowledgment = acknowledgmentFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "acknowledgment" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "SubmitAttachmentStateChanges" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Stops a running task. Any tags associated with the task will be deleted.

When `StopTask` is called on a task, the equivalent of `docker stop` is issued to the containers running in the task. This results in a `SIGTERM` value and a default 30-second timeout, after which the `SIGKILL` value is sent and the containers are forcibly stopped. If the container handles the `SIGTERM` value gracefully and exits within 30 seconds from receiving it, no `SIGKILL` value is sent.

The default 30-second timeout can be configured on the Amazon ECS container agent with the `ECS_CONTAINER_STOP_TIMEOUT` variable. For more information, see `Amazon ECS Container Agent Configuration` in the Amazon Elastic Container Service Developer Guide.

-}
stopTask : StopTaskRequest -> AWS.Http.Request AWS.Http.AWSAppError StopTaskResponse
stopTask req =
    let
        encoder val =
            [ ( "task", val.task ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "reason", val.reason ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\taskFld -> { task = taskFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "task" (Json.Decode.maybe taskDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "StopTask" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Starts a new task from the specified task definition on the specified container instance or instances.

Alternatively, you can use `RunTask` to place tasks for you. For more information, see `Scheduling Tasks` in the Amazon Elastic Container Service Developer Guide.

-}
startTask : StartTaskRequest -> AWS.Http.Request AWS.Http.AWSAppError StartTaskResponse
startTask req =
    let
        encoder val =
            [ ( "taskDefinition", val.taskDefinition ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "tags", val.tags ) |> EncodeOpt.optionalField (Codec.encoder tagsCodec)
            , ( "startedBy", val.startedBy ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "propagateTags", val.propagateTags ) |> EncodeOpt.optionalField (Codec.encoder propagateTagsCodec)
            , ( "overrides", val.overrides ) |> EncodeOpt.optionalField (Codec.encoder taskOverrideCodec)
            , ( "networkConfiguration", val.networkConfiguration )
                |> EncodeOpt.optionalField (Codec.encoder networkConfigurationCodec)
            , ( "group", val.group ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "enableECSManagedTags", val.enableEcsmanagedTags )
                |> EncodeOpt.optionalField (Codec.encoder booleanCodec)
            , ( "containerInstances", val.containerInstances ) |> EncodeOpt.field (Codec.encoder stringListCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\tasksFld failuresFld -> { failures = failuresFld, tasks = tasksFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "tasks" (Json.Decode.maybe tasksDecoder) Nothing
                |> Pipeline.optional "failures" (Json.Decode.maybe failuresDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "StartTask" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Starts a new task using the specified task definition.

You can allow Amazon ECS to place tasks for you, or you can customize how Amazon ECS places tasks using placement constraints and placement strategies. For more information, see `Scheduling Tasks` in the Amazon Elastic Container Service Developer Guide.

Alternatively, you can use `StartTask` to use your own scheduler or place tasks manually on specific container instances.

The Amazon ECS API follows an eventual consistency model, due to the distributed nature of the system supporting the API. This means that the result of an API command you run that affects your Amazon ECS resources might not be immediately visible to all subsequent commands you run. Keep this in mind when you carry out an API command that immediately follows a previous API command.

To manage eventual consistency, you can do the following:

  - Confirm the state of the resource before you run a command to modify it. Run the DescribeTasks command using an exponential backoff algorithm to ensure that you allow enough time for the previous command to propagate through the system. To do this, run the DescribeTasks command repeatedly, starting with a couple of seconds of wait time and increasing gradually up to five minutes of wait time. Add wait time between subsequent commands, even if the DescribeTasks command returns an accurate response. Apply an exponential backoff algorithm starting with a couple of seconds of wait time, and increase gradually up to about five minutes of wait time.

-}
runTask : RunTaskRequest -> AWS.Http.Request AWS.Http.AWSAppError RunTaskResponse
runTask req =
    let
        encoder val =
            [ ( "taskDefinition", val.taskDefinition ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "tags", val.tags ) |> EncodeOpt.optionalField (Codec.encoder tagsCodec)
            , ( "startedBy", val.startedBy ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "propagateTags", val.propagateTags ) |> EncodeOpt.optionalField (Codec.encoder propagateTagsCodec)
            , ( "platformVersion", val.platformVersion ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "placementStrategy", val.placementStrategy )
                |> EncodeOpt.optionalField (Codec.encoder placementStrategiesCodec)
            , ( "placementConstraints", val.placementConstraints )
                |> EncodeOpt.optionalField (Codec.encoder placementConstraintsCodec)
            , ( "overrides", val.overrides ) |> EncodeOpt.optionalField (Codec.encoder taskOverrideCodec)
            , ( "networkConfiguration", val.networkConfiguration )
                |> EncodeOpt.optionalField (Codec.encoder networkConfigurationCodec)
            , ( "launchType", val.launchType ) |> EncodeOpt.optionalField (Codec.encoder launchTypeCodec)
            , ( "group", val.group ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "enableECSManagedTags", val.enableEcsmanagedTags )
                |> EncodeOpt.optionalField (Codec.encoder booleanCodec)
            , ( "count", val.count ) |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\tasksFld failuresFld -> { failures = failuresFld, tasks = tasksFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "tasks" (Json.Decode.maybe tasksDecoder) Nothing
                |> Pipeline.optional "failures" (Json.Decode.maybe failuresDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "RunTask" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Registers a new task definition from the supplied `family` and `containerDefinitions`. Optionally, you can add data volumes to your containers with the `volumes` parameter. For more information about task definition parameters and defaults, see `Amazon ECS Task Definitions` in the Amazon Elastic Container Service Developer Guide.

You can specify an IAM role for your task with the `taskRoleArn` parameter. When you specify an IAM role for a task, its containers can then use the latest versions of the AWS CLI or SDKs to make API requests to the AWS services that are specified in the IAM policy associated with the role. For more information, see `IAM Roles for Tasks` in the Amazon Elastic Container Service Developer Guide.

You can specify a Docker networking mode for the containers in your task definition with the `networkMode` parameter. The available network modes correspond to those described in `Network settings` in the Docker run reference. If you specify the `awsvpc` network mode, the task is allocated an elastic network interface, and you must specify a `NetworkConfiguration` when you create a service or run a task with the task definition. For more information, see `Task Networking` in the Amazon Elastic Container Service Developer Guide.

-}
registerTaskDefinition : RegisterTaskDefinitionRequest -> AWS.Http.Request AWS.Http.AWSAppError RegisterTaskDefinitionResponse
registerTaskDefinition req =
    let
        encoder val =
            [ ( "volumes", val.volumes ) |> EncodeOpt.optionalField (Codec.encoder volumeListCodec)
            , ( "taskRoleArn", val.taskRoleArn ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "tags", val.tags ) |> EncodeOpt.optionalField (Codec.encoder tagsCodec)
            , ( "requiresCompatibilities", val.requiresCompatibilities )
                |> EncodeOpt.optionalField (Codec.encoder compatibilityListCodec)
            , ( "proxyConfiguration", val.proxyConfiguration )
                |> EncodeOpt.optionalField (Codec.encoder proxyConfigurationCodec)
            , ( "placementConstraints", val.placementConstraints )
                |> EncodeOpt.optionalField (Codec.encoder taskDefinitionPlacementConstraintsCodec)
            , ( "pidMode", val.pidMode ) |> EncodeOpt.optionalField (Codec.encoder pidModeCodec)
            , ( "networkMode", val.networkMode ) |> EncodeOpt.optionalField (Codec.encoder networkModeCodec)
            , ( "memory", val.memory ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "ipcMode", val.ipcMode ) |> EncodeOpt.optionalField (Codec.encoder ipcModeCodec)
            , ( "family", val.family ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "executionRoleArn", val.executionRoleArn ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "cpu", val.cpu ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "containerDefinitions", val.containerDefinitions )
                |> EncodeOpt.field (Codec.encoder containerDefinitionsCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\taskDefinitionFld tagsFld -> { tags = tagsFld, taskDefinition = taskDefinitionFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "taskDefinition" (Json.Decode.maybe taskDefinitionDecoder) Nothing
                |> Pipeline.optional "tags" (Json.Decode.maybe (Codec.decoder tagsCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "RegisterTaskDefinition" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| This action is only used by the Amazon ECS agent, and it is not intended for use outside of the agent.

Registers an EC2 instance into the specified cluster. This instance becomes available to place containers on.

-}
registerContainerInstance : RegisterContainerInstanceRequest -> AWS.Http.Request AWS.Http.AWSAppError RegisterContainerInstanceResponse
registerContainerInstance req =
    let
        encoder val =
            [ ( "versionInfo", val.versionInfo ) |> EncodeOpt.optionalField (Codec.encoder versionInfoCodec)
            , ( "totalResources", val.totalResources ) |> EncodeOpt.optionalField (Codec.encoder resourcesCodec)
            , ( "tags", val.tags ) |> EncodeOpt.optionalField (Codec.encoder tagsCodec)
            , ( "platformDevices", val.platformDevices ) |> EncodeOpt.optionalField platformDevicesEncoder
            , ( "instanceIdentityDocumentSignature", val.instanceIdentityDocumentSignature )
                |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "instanceIdentityDocument", val.instanceIdentityDocument )
                |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "containerInstanceArn", val.containerInstanceArn )
                |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "attributes", val.attributes ) |> EncodeOpt.optionalField (Codec.encoder attributesCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\containerInstanceFld -> { containerInstance = containerInstanceFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "containerInstance" (Json.Decode.maybe containerInstanceDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "RegisterContainerInstance" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Create or update an attribute on an Amazon ECS resource. If the attribute does not exist, it is created. If the attribute exists, its value is replaced with the specified value. To delete an attribute, use `DeleteAttributes`. For more information, see `Attributes` in the Amazon Elastic Container Service Developer Guide.
-}
putAttributes : PutAttributesRequest -> AWS.Http.Request AWS.Http.AWSAppError PutAttributesResponse
putAttributes req =
    let
        encoder val =
            [ ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "attributes", val.attributes ) |> EncodeOpt.field (Codec.encoder attributesCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\attributesFld -> { attributes = attributesFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "attributes" (Json.Decode.maybe (Codec.decoder attributesCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "PutAttributes" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Modifies an account setting for all IAM users on an account for whom no individual account setting has been specified.
-}
putAccountSettingDefault : PutAccountSettingDefaultRequest -> AWS.Http.Request AWS.Http.AWSAppError PutAccountSettingDefaultResponse
putAccountSettingDefault req =
    let
        encoder val =
            [ ( "value", val.value ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "name", val.name ) |> EncodeOpt.field (Codec.encoder settingNameCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\settingFld -> { setting = settingFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "setting" (Json.Decode.maybe settingDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "PutAccountSettingDefault" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Modifies an account setting. If you change the account setting for the root user, the default settings for all of the IAM users and roles for which no individual account setting has been specified are reset. For more information, see `Account Settings` in the Amazon Elastic Container Service Developer Guide.

When `serviceLongArnFormat`, `taskLongArnFormat`, or `containerInstanceLongArnFormat` are specified, the Amazon Resource Name (ARN) and resource ID format of the resource type for a specified IAM user, IAM role, or the root user for an account is affected. The opt-in and opt-out account setting must be set for each Amazon ECS resource separately. The ARN and resource ID format of a resource will be defined by the opt-in status of the IAM user or role that created the resource. You must enable this setting to use Amazon ECS features such as resource tagging.

When `awsvpcTrunking` is specified, the elastic network interface (ENI) limit for any new container instances that support the feature is changed. If `awsvpcTrunking` is enabled, any new container instances that support the feature are launched have the increased ENI limits available to them. For more information, see `Elastic Network Interface Trunking` in the Amazon Elastic Container Service Developer Guide.

When `containerInsights` is specified, the default setting indicating whether CloudWatch Container Insights is enabled for your clusters is changed. If `containerInsights` is enabled, any new clusters that are created will have Container Insights enabled unless you disable it during cluster creation. For more information, see `CloudWatch Container Insights` in the Amazon Elastic Container Service Developer Guide.

-}
putAccountSetting : PutAccountSettingRequest -> AWS.Http.Request AWS.Http.AWSAppError PutAccountSettingResponse
putAccountSetting req =
    let
        encoder val =
            [ ( "value", val.value ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "principalArn", val.principalArn ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "name", val.name ) |> EncodeOpt.field (Codec.encoder settingNameCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\settingFld -> { setting = settingFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "setting" (Json.Decode.maybe settingDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "PutAccountSetting" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Returns a list of tasks for a specified cluster. You can filter the results by family name, by a particular container instance, or by the desired status of the task with the `family`, `containerInstance`, and `desiredStatus` parameters.

Recently stopped tasks might appear in the returned results. Currently, stopped tasks appear in the returned results for at least one hour.

-}
listTasks : ListTasksRequest -> AWS.Http.Request AWS.Http.AWSAppError ListTasksResponse
listTasks req =
    let
        encoder val =
            [ ( "startedBy", val.startedBy ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "serviceName", val.serviceName ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "nextToken", val.nextToken ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "maxResults", val.maxResults ) |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
            , ( "launchType", val.launchType ) |> EncodeOpt.optionalField (Codec.encoder launchTypeCodec)
            , ( "family", val.family ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "desiredStatus", val.desiredStatus ) |> EncodeOpt.optionalField desiredStatusEncoder
            , ( "containerInstance", val.containerInstance ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\taskArnsFld nextTokenFld -> { nextToken = nextTokenFld, taskArns = taskArnsFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "taskArns" (Json.Decode.maybe (Codec.decoder stringListCodec)) Nothing
                |> Pipeline.optional "nextToken" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListTasks" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Returns a list of task definitions that are registered to your account. You can filter the results by family name with the `familyPrefix` parameter or by status with the `status` parameter.
-}
listTaskDefinitions : ListTaskDefinitionsRequest -> AWS.Http.Request AWS.Http.AWSAppError ListTaskDefinitionsResponse
listTaskDefinitions req =
    let
        encoder val =
            [ ( "status", val.status ) |> EncodeOpt.optionalField (Codec.encoder taskDefinitionStatusCodec)
            , ( "sort", val.sort ) |> EncodeOpt.optionalField sortOrderEncoder
            , ( "nextToken", val.nextToken ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "maxResults", val.maxResults ) |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
            , ( "familyPrefix", val.familyPrefix ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\taskDefinitionArnsFld nextTokenFld ->
                { nextToken = nextTokenFld, taskDefinitionArns = taskDefinitionArnsFld }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "taskDefinitionArns" (Json.Decode.maybe (Codec.decoder stringListCodec)) Nothing
                |> Pipeline.optional "nextToken" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListTaskDefinitions" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Returns a list of task definition families that are registered to your account (which may include task definition families that no longer have any `ACTIVE` task definition revisions).

You can filter out task definition families that do not contain any `ACTIVE` task definition revisions by setting the `status` parameter to `ACTIVE`. You can also filter the results with the `familyPrefix` parameter.

-}
listTaskDefinitionFamilies : ListTaskDefinitionFamiliesRequest -> AWS.Http.Request AWS.Http.AWSAppError ListTaskDefinitionFamiliesResponse
listTaskDefinitionFamilies req =
    let
        encoder val =
            [ ( "status", val.status ) |> EncodeOpt.optionalField taskDefinitionFamilyStatusEncoder
            , ( "nextToken", val.nextToken ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "maxResults", val.maxResults ) |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
            , ( "familyPrefix", val.familyPrefix ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nextTokenFld familiesFld -> { families = familiesFld, nextToken = nextTokenFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "nextToken" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
                |> Pipeline.optional "families" (Json.Decode.maybe (Codec.decoder stringListCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListTaskDefinitionFamilies" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| List the tags for an Amazon ECS resource.
-}
listTagsForResource : ListTagsForResourceRequest -> AWS.Http.Request AWS.Http.AWSAppError ListTagsForResourceResponse
listTagsForResource req =
    let
        encoder val =
            [ ( "resourceArn", val.resourceArn ) |> EncodeOpt.field (Codec.encoder stringCodec) ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\tagsFld -> { tags = tagsFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "tags" (Json.Decode.maybe (Codec.decoder tagsCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListTagsForResource" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Lists the services that are running in a specified cluster.
-}
listServices : ListServicesRequest -> AWS.Http.Request AWS.Http.AWSAppError ListServicesResponse
listServices req =
    let
        encoder val =
            [ ( "schedulingStrategy", val.schedulingStrategy )
                |> EncodeOpt.optionalField (Codec.encoder schedulingStrategyCodec)
            , ( "nextToken", val.nextToken ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "maxResults", val.maxResults ) |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
            , ( "launchType", val.launchType ) |> EncodeOpt.optionalField (Codec.encoder launchTypeCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\serviceArnsFld nextTokenFld -> { nextToken = nextTokenFld, serviceArns = serviceArnsFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "serviceArns" (Json.Decode.maybe (Codec.decoder stringListCodec)) Nothing
                |> Pipeline.optional "nextToken" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListServices" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Returns a list of container instances in a specified cluster. You can filter the results of a `ListContainerInstances` operation with cluster query language statements inside the `filter` parameter. For more information, see `Cluster Query Language` in the Amazon Elastic Container Service Developer Guide.
-}
listContainerInstances : ListContainerInstancesRequest -> AWS.Http.Request AWS.Http.AWSAppError ListContainerInstancesResponse
listContainerInstances req =
    let
        encoder val =
            [ ( "status", val.status ) |> EncodeOpt.optionalField containerInstanceStatusEncoder
            , ( "nextToken", val.nextToken ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "maxResults", val.maxResults ) |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
            , ( "filter", val.filter ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nextTokenFld containerInstanceArnsFld ->
                { containerInstanceArns = containerInstanceArnsFld, nextToken = nextTokenFld }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "nextToken" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
                |> Pipeline.optional "containerInstanceArns" (Json.Decode.maybe (Codec.decoder stringListCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListContainerInstances" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Returns a list of existing clusters.
-}
listClusters : ListClustersRequest -> AWS.Http.Request AWS.Http.AWSAppError ListClustersResponse
listClusters req =
    let
        encoder val =
            [ ( "nextToken", val.nextToken ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "maxResults", val.maxResults ) |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nextTokenFld clusterArnsFld -> { clusterArns = clusterArnsFld, nextToken = nextTokenFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "nextToken" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
                |> Pipeline.optional "clusterArns" (Json.Decode.maybe (Codec.decoder stringListCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListClusters" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Lists the attributes for Amazon ECS resources within a specified target type and cluster. When you specify a target type and cluster, `ListAttributes` returns a list of attribute objects, one for each attribute on each resource. You can filter the list of results to a single attribute name to only return results that have that name. You can also filter the results by attribute name and value, for example, to see which container instances in a cluster are running a Linux AMI (`ecs.os-type=linux`).
-}
listAttributes : ListAttributesRequest -> AWS.Http.Request AWS.Http.AWSAppError ListAttributesResponse
listAttributes req =
    let
        encoder val =
            [ ( "targetType", val.targetType ) |> EncodeOpt.field (Codec.encoder targetTypeCodec)
            , ( "nextToken", val.nextToken ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "maxResults", val.maxResults ) |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "attributeValue", val.attributeValue ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "attributeName", val.attributeName ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\nextTokenFld attributesFld -> { attributes = attributesFld, nextToken = nextTokenFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "nextToken" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
                |> Pipeline.optional "attributes" (Json.Decode.maybe (Codec.decoder attributesCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListAttributes" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Lists the account settings for a specified principal.
-}
listAccountSettings : ListAccountSettingsRequest -> AWS.Http.Request AWS.Http.AWSAppError ListAccountSettingsResponse
listAccountSettings req =
    let
        encoder val =
            [ ( "value", val.value ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "principalArn", val.principalArn ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "nextToken", val.nextToken ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "name", val.name ) |> EncodeOpt.optionalField (Codec.encoder settingNameCodec)
            , ( "maxResults", val.maxResults ) |> EncodeOpt.optionalField (Codec.encoder integerCodec)
            , ( "effectiveSettings", val.effectiveSettings ) |> EncodeOpt.optionalField (Codec.encoder booleanCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\settingsFld nextTokenFld -> { nextToken = nextTokenFld, settings = settingsFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "settings" (Json.Decode.maybe settingsDecoder) Nothing
                |> Pipeline.optional "nextToken" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "ListAccountSettings" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| This action is only used by the Amazon ECS agent, and it is not intended for use outside of the agent.

Returns an endpoint for the Amazon ECS agent to poll for updates.

-}
discoverPollEndpoint : DiscoverPollEndpointRequest -> AWS.Http.Request AWS.Http.AWSAppError DiscoverPollEndpointResponse
discoverPollEndpoint req =
    let
        encoder val =
            [ ( "containerInstance", val.containerInstance ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\telemetryEndpointFld endpointFld -> { endpoint = endpointFld, telemetryEndpoint = telemetryEndpointFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "telemetryEndpoint" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
                |> Pipeline.optional "endpoint" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DiscoverPollEndpoint" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Describes a specified task or tasks.
-}
describeTasks : DescribeTasksRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeTasksResponse
describeTasks req =
    let
        encoder val =
            [ ( "tasks", val.tasks ) |> EncodeOpt.field (Codec.encoder stringListCodec)
            , ( "include", val.include ) |> EncodeOpt.optionalField taskFieldListEncoder
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\tasksFld failuresFld -> { failures = failuresFld, tasks = tasksFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "tasks" (Json.Decode.maybe tasksDecoder) Nothing
                |> Pipeline.optional "failures" (Json.Decode.maybe failuresDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeTasks" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Describes the task sets in the specified cluster and service. This is used when a service uses the `EXTERNAL` deployment controller type. For more information, see `Amazon ECS Deployment Types` in the Amazon Elastic Container Service Developer Guide.
-}
describeTaskSets : DescribeTaskSetsRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeTaskSetsResponse
describeTaskSets req =
    let
        encoder val =
            [ ( "taskSets", val.taskSets ) |> EncodeOpt.optionalField (Codec.encoder stringListCodec)
            , ( "service", val.service ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.field (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\taskSetsFld failuresFld -> { failures = failuresFld, taskSets = taskSetsFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "taskSets" (Json.Decode.maybe taskSetsDecoder) Nothing
                |> Pipeline.optional "failures" (Json.Decode.maybe failuresDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeTaskSets" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Describes a task definition. You can specify a `family` and `revision` to find information about a specific task definition, or you can simply specify the family to find the latest `ACTIVE` revision in that family.

You can only describe `INACTIVE` task definitions while an active task or service references them.

-}
describeTaskDefinition : DescribeTaskDefinitionRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeTaskDefinitionResponse
describeTaskDefinition req =
    let
        encoder val =
            [ ( "taskDefinition", val.taskDefinition ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "include", val.include ) |> EncodeOpt.optionalField taskDefinitionFieldListEncoder
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\taskDefinitionFld tagsFld -> { tags = tagsFld, taskDefinition = taskDefinitionFld })
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "taskDefinition" (Json.Decode.maybe taskDefinitionDecoder) Nothing
                |> Pipeline.optional "tags" (Json.Decode.maybe (Codec.decoder tagsCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeTaskDefinition" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Describes the specified services running in your cluster.
-}
describeServices : DescribeServicesRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeServicesResponse
describeServices req =
    let
        encoder val =
            [ ( "services", val.services ) |> EncodeOpt.field (Codec.encoder stringListCodec)
            , ( "include", val.include ) |> EncodeOpt.optionalField serviceFieldListEncoder
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\servicesFld failuresFld -> { failures = failuresFld, services = servicesFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "services" (Json.Decode.maybe servicesDecoder) Nothing
                |> Pipeline.optional "failures" (Json.Decode.maybe failuresDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeServices" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Describes Amazon Elastic Container Service container instances. Returns metadata about registered and remaining resources on each container instance requested.
-}
describeContainerInstances : DescribeContainerInstancesRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeContainerInstancesResponse
describeContainerInstances req =
    let
        encoder val =
            [ ( "include", val.include ) |> EncodeOpt.optionalField containerInstanceFieldListEncoder
            , ( "containerInstances", val.containerInstances ) |> EncodeOpt.field (Codec.encoder stringListCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\failuresFld containerInstancesFld ->
                { containerInstances = containerInstancesFld, failures = failuresFld }
             )
                |> Json.Decode.succeed
            )
                |> Pipeline.optional "failures" (Json.Decode.maybe failuresDecoder) Nothing
                |> Pipeline.optional "containerInstances" (Json.Decode.maybe containerInstancesDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeContainerInstances" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Describes one or more of your clusters.
-}
describeClusters : DescribeClustersRequest -> AWS.Http.Request AWS.Http.AWSAppError DescribeClustersResponse
describeClusters req =
    let
        encoder val =
            [ ( "include", val.include ) |> EncodeOpt.optionalField clusterFieldListEncoder
            , ( "clusters", val.clusters ) |> EncodeOpt.optionalField (Codec.encoder stringListCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\failuresFld clustersFld -> { clusters = clustersFld, failures = failuresFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "failures" (Json.Decode.maybe failuresDecoder) Nothing
                |> Pipeline.optional "clusters" (Json.Decode.maybe clustersDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DescribeClusters" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deregisters the specified task definition by family and revision. Upon deregistration, the task definition is marked as `INACTIVE`. Existing tasks and services that reference an `INACTIVE` task definition continue to run without disruption. Existing services that reference an `INACTIVE` task definition can still scale up or down by modifying the service's desired count.

You cannot use an `INACTIVE` task definition to run new tasks or create new services, and you cannot update an existing service to reference an `INACTIVE` task definition. However, there may be up to a 10-minute window following deregistration where these restrictions have not yet taken effect.

At this time, `INACTIVE` task definitions remain discoverable in your account indefinitely. However, this behavior is subject to change in the future, so you should not rely on `INACTIVE` task definitions persisting beyond the lifecycle of any associated tasks and services.

-}
deregisterTaskDefinition : DeregisterTaskDefinitionRequest -> AWS.Http.Request AWS.Http.AWSAppError DeregisterTaskDefinitionResponse
deregisterTaskDefinition req =
    let
        encoder val =
            [ ( "taskDefinition", val.taskDefinition ) |> EncodeOpt.field (Codec.encoder stringCodec) ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\taskDefinitionFld -> { taskDefinition = taskDefinitionFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "taskDefinition" (Json.Decode.maybe taskDefinitionDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DeregisterTaskDefinition" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deregisters an Amazon ECS container instance from the specified cluster. This instance is no longer available to run tasks.

If you intend to use the container instance for some other purpose after deregistration, you should stop all of the tasks running on the container instance before deregistration. That prevents any orphaned tasks from consuming resources.

Deregistering a container instance removes the instance from a cluster, but it does not terminate the EC2 instance. If you are finished using the instance, be sure to terminate it in the Amazon EC2 console to stop billing.

If you terminate a running container instance, Amazon ECS automatically deregisters the instance from your cluster (stopped container instances or instances with disconnected agents are not automatically deregistered when terminated).

-}
deregisterContainerInstance : DeregisterContainerInstanceRequest -> AWS.Http.Request AWS.Http.AWSAppError DeregisterContainerInstanceResponse
deregisterContainerInstance req =
    let
        encoder val =
            [ ( "force", val.force ) |> EncodeOpt.optionalField (Codec.encoder boxedBooleanCodec)
            , ( "containerInstance", val.containerInstance ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\containerInstanceFld -> { containerInstance = containerInstanceFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "containerInstance" (Json.Decode.maybe containerInstanceDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DeregisterContainerInstance" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes a specified task set within a service. This is used when a service uses the `EXTERNAL` deployment controller type. For more information, see `Amazon ECS Deployment Types` in the Amazon Elastic Container Service Developer Guide.
-}
deleteTaskSet : DeleteTaskSetRequest -> AWS.Http.Request AWS.Http.AWSAppError DeleteTaskSetResponse
deleteTaskSet req =
    let
        encoder val =
            [ ( "taskSet", val.taskSet ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "service", val.service ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "force", val.force ) |> EncodeOpt.optionalField (Codec.encoder boxedBooleanCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.field (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\taskSetFld -> { taskSet = taskSetFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "taskSet" (Json.Decode.maybe taskSetDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DeleteTaskSet" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes a specified service within a cluster. You can delete a service if you have no running tasks in it and the desired task count is zero. If the service is actively maintaining tasks, you cannot delete it, and you must update the service to a desired task count of zero. For more information, see `UpdateService`.

When you delete a service, if there are still running tasks that require cleanup, the service status moves from `ACTIVE` to `DRAINING`, and the service is no longer visible in the console or in the `ListServices` API operation. After the tasks have stopped, then the service status moves from `DRAINING` to `INACTIVE`. Services in the `DRAINING` or `INACTIVE` status can still be viewed with the `DescribeServices` API operation. However, in the future, `INACTIVE` services may be cleaned up and purged from Amazon ECS record keeping, and `DescribeServices` calls on those services return a `ServiceNotFoundException` error.

If you attempt to create a new service with the same name as an existing service in either `ACTIVE` or `DRAINING` status, you receive an error.

-}
deleteService : DeleteServiceRequest -> AWS.Http.Request AWS.Http.AWSAppError DeleteServiceResponse
deleteService req =
    let
        encoder val =
            [ ( "service", val.service ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "force", val.force ) |> EncodeOpt.optionalField (Codec.encoder boxedBooleanCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\serviceFld -> { service = serviceFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "service" (Json.Decode.maybe serviceDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DeleteService" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes the specified cluster. You must deregister all container instances from this cluster before you may delete it. You can list the container instances in a cluster with `ListContainerInstances` and deregister them with `DeregisterContainerInstance`.
-}
deleteCluster : DeleteClusterRequest -> AWS.Http.Request AWS.Http.AWSAppError DeleteClusterResponse
deleteCluster req =
    let
        encoder val =
            [ ( "cluster", val.cluster ) |> EncodeOpt.field (Codec.encoder stringCodec) ] |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\clusterFld -> { cluster = clusterFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "cluster" (Json.Decode.maybe clusterDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DeleteCluster" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Deletes one or more custom attributes from an Amazon ECS resource.
-}
deleteAttributes : DeleteAttributesRequest -> AWS.Http.Request AWS.Http.AWSAppError DeleteAttributesResponse
deleteAttributes req =
    let
        encoder val =
            [ ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "attributes", val.attributes ) |> EncodeOpt.field (Codec.encoder attributesCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\attributesFld -> { attributes = attributesFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "attributes" (Json.Decode.maybe (Codec.decoder attributesCodec)) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DeleteAttributes" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Disables an account setting for a specified IAM user, IAM role, or the root user for an account.
-}
deleteAccountSetting : DeleteAccountSettingRequest -> AWS.Http.Request AWS.Http.AWSAppError DeleteAccountSettingResponse
deleteAccountSetting req =
    let
        encoder val =
            [ ( "principalArn", val.principalArn ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "name", val.name ) |> EncodeOpt.field (Codec.encoder settingNameCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\settingFld -> { setting = settingFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "setting" (Json.Decode.maybe settingDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "DeleteAccountSetting" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Create a task set in the specified cluster and service. This is used when a service uses the `EXTERNAL` deployment controller type. For more information, see `Amazon ECS Deployment Types` in the Amazon Elastic Container Service Developer Guide.
-}
createTaskSet : CreateTaskSetRequest -> AWS.Http.Request AWS.Http.AWSAppError CreateTaskSetResponse
createTaskSet req =
    let
        encoder val =
            [ ( "taskDefinition", val.taskDefinition ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "serviceRegistries", val.serviceRegistries )
                |> EncodeOpt.optionalField (Codec.encoder serviceRegistriesCodec)
            , ( "service", val.service ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "scale", val.scale ) |> EncodeOpt.optionalField (Codec.encoder scaleCodec)
            , ( "platformVersion", val.platformVersion ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "networkConfiguration", val.networkConfiguration )
                |> EncodeOpt.optionalField (Codec.encoder networkConfigurationCodec)
            , ( "loadBalancers", val.loadBalancers ) |> EncodeOpt.optionalField (Codec.encoder loadBalancersCodec)
            , ( "launchType", val.launchType ) |> EncodeOpt.optionalField (Codec.encoder launchTypeCodec)
            , ( "externalId", val.externalId ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "clientToken", val.clientToken ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\taskSetFld -> { taskSet = taskSetFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "taskSet" (Json.Decode.maybe taskSetDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CreateTaskSet" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Runs and maintains a desired number of tasks from a specified task definition. If the number of tasks running in a service drops below the `desiredCount`, Amazon ECS spawns another copy of the task in the specified cluster. To update an existing service, see `UpdateService`.

In addition to maintaining the desired count of tasks in your service, you can optionally run your service behind a load balancer. The load balancer distributes traffic across the tasks that are associated with the service. For more information, see `Service Load Balancing` in the Amazon Elastic Container Service Developer Guide.

Tasks for services that do not use a load balancer are considered healthy if they're in the `RUNNING` state. Tasks for services that do use a load balancer are considered healthy if they're in the `RUNNING` state and the container instance that they're hosted on is reported as healthy by the load balancer.

There are two service scheduler strategies available:

  -     `REPLICA` - The replica scheduling strategy places and maintains the desired number of tasks across your cluster. By default, the service scheduler spreads tasks across Availability Zones. You can use task placement strategies and constraints to customize task placement decisions. For more information, see `Service Scheduler Concepts` in the Amazon Elastic Container Service Developer Guide.    `DAEMON` - The daemon scheduling strategy deploys exactly one task on each active container instance that meets all of the task placement constraints that you specify in your cluster. When using this strategy, you don't need to specify a desired number of tasks, a task placement strategy, or use Service Auto Scaling policies. For more information, see `Service Scheduler Concepts` in the Amazon Elastic Container Service Developer Guide.

You can optionally specify a deployment configuration for your service. The deployment is triggered by changing properties, such as the task definition or the desired count of a service, with an `UpdateService` operation. The default value for a replica service for `minimumHealthyPercent` is 100%. The default value for a daemon service for `minimumHealthyPercent` is 0%.

If a service is using the `ECS` deployment controller, the minimum healthy percent represents a lower limit on the number of tasks in a service that must remain in the `RUNNING` state during a deployment, as a percentage of the desired number of tasks (rounded up to the nearest integer), and while any container instances are in the `DRAINING` state if the service contains tasks using the EC2 launch type. This parameter enables you to deploy without using additional cluster capacity. For example, if your service has a desired number of four tasks and a minimum healthy percent of 50%, the scheduler might stop two existing tasks to free up cluster capacity before starting two new tasks. Tasks for services that do not use a load balancer are considered healthy if they're in the `RUNNING` state. Tasks for services that do use a load balancer are considered healthy if they're in the `RUNNING` state and they're reported as healthy by the load balancer. The default value for minimum healthy percent is 100%.

If a service is using the `ECS` deployment controller, the maximum percent parameter represents an upper limit on the number of tasks in a service that are allowed in the `RUNNING` or `PENDING` state during a deployment, as a percentage of the desired number of tasks (rounded down to the nearest integer), and while any container instances are in the `DRAINING` state if the service contains tasks using the EC2 launch type. This parameter enables you to define the deployment batch size. For example, if your service has a desired number of four tasks and a maximum percent value of 200%, the scheduler may start four new tasks before stopping the four older tasks (provided that the cluster resources required to do this are available). The default value for maximum percent is 200%.

If a service is using either the `CODE_DEPLOY` or `EXTERNAL` deployment controller types and tasks that use the EC2 launch type, the minimum healthy percent and maximum percent values are used only to define the lower and upper limit on the number of the tasks in the service that remain in the `RUNNING` state while the container instances are in the `DRAINING` state. If the tasks in the service use the Fargate launch type, the minimum healthy percent and maximum percent values aren't used, although they're currently visible when describing your service.

When creating a service that uses the `EXTERNAL` deployment controller, you can specify only parameters that aren't controlled at the task set level. The only required parameter is the service name. You control your services using the `CreateTaskSet` operation. For more information, see `Amazon ECS Deployment Types` in the Amazon Elastic Container Service Developer Guide.

When the service scheduler launches new tasks, it determines task placement in your cluster using the following logic:

  - Determine which of the container instances in your cluster can support your service's task definition (for example, they have the required CPU, memory, ports, and container instance attributes). By default, the service scheduler attempts to balance tasks across Availability Zones in this manner (although you can choose a different placement strategy) with the `placementStrategy` parameter): Sort the valid container instances, giving priority to instances that have the fewest number of running tasks for this service in their respective Availability Zone. For example, if zone A has one running service task and zones B and C each have zero, valid container instances in either zone B or C are considered optimal for placement. Place the new service task on a valid container instance in an optimal Availability Zone (based on the previous steps), favoring container instances with the fewest number of running tasks for this service.

-}
createService : CreateServiceRequest -> AWS.Http.Request AWS.Http.AWSAppError CreateServiceResponse
createService req =
    let
        encoder val =
            [ ( "taskDefinition", val.taskDefinition ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "tags", val.tags ) |> EncodeOpt.optionalField (Codec.encoder tagsCodec)
            , ( "serviceRegistries", val.serviceRegistries )
                |> EncodeOpt.optionalField (Codec.encoder serviceRegistriesCodec)
            , ( "serviceName", val.serviceName ) |> EncodeOpt.field (Codec.encoder stringCodec)
            , ( "schedulingStrategy", val.schedulingStrategy )
                |> EncodeOpt.optionalField (Codec.encoder schedulingStrategyCodec)
            , ( "role", val.role ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "propagateTags", val.propagateTags ) |> EncodeOpt.optionalField (Codec.encoder propagateTagsCodec)
            , ( "platformVersion", val.platformVersion ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "placementStrategy", val.placementStrategy )
                |> EncodeOpt.optionalField (Codec.encoder placementStrategiesCodec)
            , ( "placementConstraints", val.placementConstraints )
                |> EncodeOpt.optionalField (Codec.encoder placementConstraintsCodec)
            , ( "networkConfiguration", val.networkConfiguration )
                |> EncodeOpt.optionalField (Codec.encoder networkConfigurationCodec)
            , ( "loadBalancers", val.loadBalancers ) |> EncodeOpt.optionalField (Codec.encoder loadBalancersCodec)
            , ( "launchType", val.launchType ) |> EncodeOpt.optionalField (Codec.encoder launchTypeCodec)
            , ( "healthCheckGracePeriodSeconds", val.healthCheckGracePeriodSeconds )
                |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
            , ( "enableECSManagedTags", val.enableEcsmanagedTags )
                |> EncodeOpt.optionalField (Codec.encoder booleanCodec)
            , ( "desiredCount", val.desiredCount ) |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
            , ( "deploymentController", val.deploymentController )
                |> EncodeOpt.optionalField (Codec.encoder deploymentControllerCodec)
            , ( "deploymentConfiguration", val.deploymentConfiguration )
                |> EncodeOpt.optionalField (Codec.encoder deploymentConfigurationCodec)
            , ( "cluster", val.cluster ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            , ( "clientToken", val.clientToken ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\serviceFld -> { service = serviceFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "service" (Json.Decode.maybe serviceDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CreateService" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| Creates a new Amazon ECS cluster. By default, your account receives a `default` cluster when you launch your first container instance. However, you can create your own cluster with a unique name with the `CreateCluster` action.

When you call the `CreateCluster` API operation, Amazon ECS attempts to create the service-linked role for your account so that required resources in other AWS services can be managed on your behalf. However, if the IAM user that makes the call does not have permissions to create the service-linked role, it is not created. For more information, see `Using Service-Linked Roles for Amazon ECS` in the Amazon Elastic Container Service Developer Guide.

-}
createCluster : CreateClusterRequest -> AWS.Http.Request AWS.Http.AWSAppError CreateClusterResponse
createCluster req =
    let
        encoder val =
            [ ( "tags", val.tags ) |> EncodeOpt.optionalField (Codec.encoder tagsCodec)
            , ( "settings", val.settings ) |> EncodeOpt.optionalField (Codec.encoder clusterSettingsCodec)
            , ( "clusterName", val.clusterName ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
            ]
                |> EncodeOpt.objectMaySkip

        jsonBody =
            req |> encoder |> AWS.Http.jsonBody

        url =
            "/"

        decoder =
            ((\clusterFld -> { cluster = clusterFld }) |> Json.Decode.succeed)
                |> Pipeline.optional "cluster" (Json.Decode.maybe clusterDecoder) Nothing
                |> AWS.Http.jsonBodyDecoder
    in
    AWS.Http.request "CreateCluster" AWS.Http.POST url jsonBody decoder AWS.Http.awsAppErrDecoder


{-| The VolumeList data model.
-}
type alias VolumeList =
    List Volume


{-| The VolumeFromList data model.
-}
type alias VolumeFromList =
    List VolumeFrom


{-| The VolumeFrom data model.
-}
type alias VolumeFrom =
    { readOnly : Maybe BoxedBoolean, sourceContainer : Maybe String_ }


{-| The Volume data model.
-}
type alias Volume =
    { dockerVolumeConfiguration : Maybe DockerVolumeConfiguration
    , host : Maybe HostVolumeProperties
    , name : Maybe String_
    }


{-| The VersionInfo data model.
-}
type alias VersionInfo =
    { agentHash : Maybe String_, agentVersion : Maybe String_, dockerVersion : Maybe String_ }


{-| The UpdateTaskSetResponse data model.
-}
type alias UpdateTaskSetResponse =
    { taskSet : Maybe TaskSet }


{-| The UpdateTaskSetRequest data model.
-}
type alias UpdateTaskSetRequest =
    { cluster : String_, scale : Scale, service : String_, taskSet : String_ }


{-| The UpdateServiceResponse data model.
-}
type alias UpdateServiceResponse =
    { service : Maybe Service }


{-| The UpdateServiceRequest data model.
-}
type alias UpdateServiceRequest =
    { cluster : Maybe String_
    , deploymentConfiguration : Maybe DeploymentConfiguration
    , desiredCount : Maybe BoxedInteger
    , forceNewDeployment : Maybe Boolean
    , healthCheckGracePeriodSeconds : Maybe BoxedInteger
    , networkConfiguration : Maybe NetworkConfiguration
    , platformVersion : Maybe String_
    , service : String_
    , taskDefinition : Maybe String_
    }


{-| The UpdateServicePrimaryTaskSetResponse data model.
-}
type alias UpdateServicePrimaryTaskSetResponse =
    { taskSet : Maybe TaskSet }


{-| The UpdateServicePrimaryTaskSetRequest data model.
-}
type alias UpdateServicePrimaryTaskSetRequest =
    { cluster : String_, primaryTaskSet : String_, service : String_ }


{-| The UpdateContainerInstancesStateResponse data model.
-}
type alias UpdateContainerInstancesStateResponse =
    { containerInstances : Maybe ContainerInstances, failures : Maybe Failures }


{-| The UpdateContainerInstancesStateRequest data model.
-}
type alias UpdateContainerInstancesStateRequest =
    { cluster : Maybe String_, containerInstances : StringList, status : ContainerInstanceStatus }


{-| The UpdateContainerAgentResponse data model.
-}
type alias UpdateContainerAgentResponse =
    { containerInstance : Maybe ContainerInstance }


{-| The UpdateContainerAgentRequest data model.
-}
type alias UpdateContainerAgentRequest =
    { cluster : Maybe String_, containerInstance : String_ }


{-| The UntagResourceResponse data model.
-}
type alias UntagResourceResponse =
    {}


{-| The UntagResourceRequest data model.
-}
type alias UntagResourceRequest =
    { resourceArn : String_, tagKeys : TagKeys }


{-| The UlimitName data model.
-}
type UlimitName
    = UlimitNameCore
    | UlimitNameCpu
    | UlimitNameData
    | UlimitNameFsize
    | UlimitNameLocks
    | UlimitNameMemlock
    | UlimitNameMsgqueue
    | UlimitNameNice
    | UlimitNameNofile
    | UlimitNameNproc
    | UlimitNameRss
    | UlimitNameRtprio
    | UlimitNameRttime
    | UlimitNameSigpending
    | UlimitNameStack


{-| The UlimitName data model.
-}
ulimitName : Enum UlimitName
ulimitName =
    Enum.define
        [ UlimitNameCore
        , UlimitNameCpu
        , UlimitNameData
        , UlimitNameFsize
        , UlimitNameLocks
        , UlimitNameMemlock
        , UlimitNameMsgqueue
        , UlimitNameNice
        , UlimitNameNofile
        , UlimitNameNproc
        , UlimitNameRss
        , UlimitNameRtprio
        , UlimitNameRttime
        , UlimitNameSigpending
        , UlimitNameStack
        ]
        (\val ->
            case val of
                UlimitNameCore ->
                    "core"

                UlimitNameCpu ->
                    "cpu"

                UlimitNameData ->
                    "data"

                UlimitNameFsize ->
                    "fsize"

                UlimitNameLocks ->
                    "locks"

                UlimitNameMemlock ->
                    "memlock"

                UlimitNameMsgqueue ->
                    "msgqueue"

                UlimitNameNice ->
                    "nice"

                UlimitNameNofile ->
                    "nofile"

                UlimitNameNproc ->
                    "nproc"

                UlimitNameRss ->
                    "rss"

                UlimitNameRtprio ->
                    "rtprio"

                UlimitNameRttime ->
                    "rttime"

                UlimitNameSigpending ->
                    "sigpending"

                UlimitNameStack ->
                    "stack"
        )


{-| The UlimitList data model.
-}
type alias UlimitList =
    List Ulimit


{-| The Ulimit data model.
-}
type alias Ulimit =
    { hardLimit : Integer, name : UlimitName, softLimit : Integer }


{-| The TransportProtocol data model.
-}
type TransportProtocol
    = TransportProtocolTcp
    | TransportProtocolUdp


{-| The TransportProtocol data model.
-}
transportProtocol : Enum TransportProtocol
transportProtocol =
    Enum.define
        [ TransportProtocolTcp, TransportProtocolUdp ]
        (\val ->
            case val of
                TransportProtocolTcp ->
                    "tcp"

                TransportProtocolUdp ->
                    "udp"
        )


{-| The TmpfsList data model.
-}
type alias TmpfsList =
    List Tmpfs


{-| The Tmpfs data model.
-}
type alias Tmpfs =
    { containerPath : String_, mountOptions : Maybe StringList, size : Integer }


{-| The Timestamp data model.
-}
type alias Timestamp =
    String


{-| The Tasks data model.
-}
type alias Tasks =
    List Task


{-| The TaskStopCode data model.
-}
type TaskStopCode
    = TaskStopCodeTaskFailedToStart
    | TaskStopCodeEssentialContainerExited
    | TaskStopCodeUserInitiated


{-| The TaskStopCode data model.
-}
taskStopCode : Enum TaskStopCode
taskStopCode =
    Enum.define
        [ TaskStopCodeTaskFailedToStart, TaskStopCodeEssentialContainerExited, TaskStopCodeUserInitiated ]
        (\val ->
            case val of
                TaskStopCodeTaskFailedToStart ->
                    "TaskFailedToStart"

                TaskStopCodeEssentialContainerExited ->
                    "EssentialContainerExited"

                TaskStopCodeUserInitiated ->
                    "UserInitiated"
        )


{-| The TaskSets data model.
-}
type alias TaskSets =
    List TaskSet


{-| The TaskSet data model.
-}
type alias TaskSet =
    { clusterArn : Maybe String_
    , computedDesiredCount : Maybe Integer
    , createdAt : Maybe Timestamp
    , externalId : Maybe String_
    , id : Maybe String_
    , launchType : Maybe LaunchType
    , loadBalancers : Maybe LoadBalancers
    , networkConfiguration : Maybe NetworkConfiguration
    , pendingCount : Maybe Integer
    , platformVersion : Maybe String_
    , runningCount : Maybe Integer
    , scale : Maybe Scale
    , serviceArn : Maybe String_
    , serviceRegistries : Maybe ServiceRegistries
    , stabilityStatus : Maybe StabilityStatus
    , stabilityStatusAt : Maybe Timestamp
    , startedBy : Maybe String_
    , status : Maybe String_
    , taskDefinition : Maybe String_
    , taskSetArn : Maybe String_
    , updatedAt : Maybe Timestamp
    }


{-| The TaskOverride data model.
-}
type alias TaskOverride =
    { containerOverrides : Maybe ContainerOverrides, executionRoleArn : Maybe String_, taskRoleArn : Maybe String_ }


{-| The TaskFieldList data model.
-}
type alias TaskFieldList =
    List TaskField


{-| The TaskField data model.
-}
type TaskField
    = TaskFieldTags


{-| The TaskField data model.
-}
taskField : Enum TaskField
taskField =
    Enum.define
        [ TaskFieldTags ]
        (\val ->
            case val of
                TaskFieldTags ->
                    "TAGS"
        )


{-| The TaskDefinitionStatus data model.
-}
type TaskDefinitionStatus
    = TaskDefinitionStatusActive
    | TaskDefinitionStatusInactive


{-| The TaskDefinitionStatus data model.
-}
taskDefinitionStatus : Enum TaskDefinitionStatus
taskDefinitionStatus =
    Enum.define
        [ TaskDefinitionStatusActive, TaskDefinitionStatusInactive ]
        (\val ->
            case val of
                TaskDefinitionStatusActive ->
                    "ACTIVE"

                TaskDefinitionStatusInactive ->
                    "INACTIVE"
        )


{-| The TaskDefinitionPlacementConstraints data model.
-}
type alias TaskDefinitionPlacementConstraints =
    List TaskDefinitionPlacementConstraint


{-| The TaskDefinitionPlacementConstraintType data model.
-}
type TaskDefinitionPlacementConstraintType
    = TaskDefinitionPlacementConstraintTypeMemberOf


{-| The TaskDefinitionPlacementConstraintType data model.
-}
taskDefinitionPlacementConstraintType : Enum TaskDefinitionPlacementConstraintType
taskDefinitionPlacementConstraintType =
    Enum.define
        [ TaskDefinitionPlacementConstraintTypeMemberOf ]
        (\val ->
            case val of
                TaskDefinitionPlacementConstraintTypeMemberOf ->
                    "memberOf"
        )


{-| The TaskDefinitionPlacementConstraint data model.
-}
type alias TaskDefinitionPlacementConstraint =
    { expression : Maybe String_, type_ : Maybe TaskDefinitionPlacementConstraintType }


{-| The TaskDefinitionFieldList data model.
-}
type alias TaskDefinitionFieldList =
    List TaskDefinitionField


{-| The TaskDefinitionField data model.
-}
type TaskDefinitionField
    = TaskDefinitionFieldTags


{-| The TaskDefinitionField data model.
-}
taskDefinitionField : Enum TaskDefinitionField
taskDefinitionField =
    Enum.define
        [ TaskDefinitionFieldTags ]
        (\val ->
            case val of
                TaskDefinitionFieldTags ->
                    "TAGS"
        )


{-| The TaskDefinitionFamilyStatus data model.
-}
type TaskDefinitionFamilyStatus
    = TaskDefinitionFamilyStatusActive
    | TaskDefinitionFamilyStatusInactive
    | TaskDefinitionFamilyStatusAll


{-| The TaskDefinitionFamilyStatus data model.
-}
taskDefinitionFamilyStatus : Enum TaskDefinitionFamilyStatus
taskDefinitionFamilyStatus =
    Enum.define
        [ TaskDefinitionFamilyStatusActive, TaskDefinitionFamilyStatusInactive, TaskDefinitionFamilyStatusAll ]
        (\val ->
            case val of
                TaskDefinitionFamilyStatusActive ->
                    "ACTIVE"

                TaskDefinitionFamilyStatusInactive ->
                    "INACTIVE"

                TaskDefinitionFamilyStatusAll ->
                    "ALL"
        )


{-| The TaskDefinition data model.
-}
type alias TaskDefinition =
    { compatibilities : Maybe CompatibilityList
    , containerDefinitions : Maybe ContainerDefinitions
    , cpu : Maybe String_
    , executionRoleArn : Maybe String_
    , family : Maybe String_
    , ipcMode : Maybe IpcMode
    , memory : Maybe String_
    , networkMode : Maybe NetworkMode
    , pidMode : Maybe PidMode
    , placementConstraints : Maybe TaskDefinitionPlacementConstraints
    , proxyConfiguration : Maybe ProxyConfiguration
    , requiresAttributes : Maybe RequiresAttributes
    , requiresCompatibilities : Maybe CompatibilityList
    , revision : Maybe Integer
    , status : Maybe TaskDefinitionStatus
    , taskDefinitionArn : Maybe String_
    , taskRoleArn : Maybe String_
    , volumes : Maybe VolumeList
    }


{-| The Task data model.
-}
type alias Task =
    { attachments : Maybe Attachments
    , clusterArn : Maybe String_
    , connectivity : Maybe Connectivity
    , connectivityAt : Maybe Timestamp
    , containerInstanceArn : Maybe String_
    , containers : Maybe Containers
    , cpu : Maybe String_
    , createdAt : Maybe Timestamp
    , desiredStatus : Maybe String_
    , executionStoppedAt : Maybe Timestamp
    , group : Maybe String_
    , healthStatus : Maybe HealthStatus
    , lastStatus : Maybe String_
    , launchType : Maybe LaunchType
    , memory : Maybe String_
    , overrides : Maybe TaskOverride
    , platformVersion : Maybe String_
    , pullStartedAt : Maybe Timestamp
    , pullStoppedAt : Maybe Timestamp
    , startedAt : Maybe Timestamp
    , startedBy : Maybe String_
    , stopCode : Maybe TaskStopCode
    , stoppedAt : Maybe Timestamp
    , stoppedReason : Maybe String_
    , stoppingAt : Maybe Timestamp
    , tags : Maybe Tags
    , taskArn : Maybe String_
    , taskDefinitionArn : Maybe String_
    , version : Maybe Long
    }


{-| The TargetType data model.
-}
type TargetType
    = TargetTypeContainerInstance


{-| The TargetType data model.
-}
targetType : Enum TargetType
targetType =
    Enum.define
        [ TargetTypeContainerInstance ]
        (\val ->
            case val of
                TargetTypeContainerInstance ->
                    "container-instance"
        )


{-| The Tags data model.
-}
type alias Tags =
    List Tag


{-| The TagValue data model.
-}
type alias TagValue =
    String


{-| The TagResourceResponse data model.
-}
type alias TagResourceResponse =
    {}


{-| The TagResourceRequest data model.
-}
type alias TagResourceRequest =
    { resourceArn : String_, tags : Tags }


{-| The TagKeys data model.
-}
type alias TagKeys =
    List TagKey


{-| The TagKey data model.
-}
type alias TagKey =
    String


{-| The Tag data model.
-}
type alias Tag =
    { key : Maybe TagKey, value : Maybe TagValue }


{-| The SystemControls data model.
-}
type alias SystemControls =
    List SystemControl


{-| The SystemControl data model.
-}
type alias SystemControl =
    { namespace : Maybe String_, value : Maybe String_ }


{-| The SubmitTaskStateChangeResponse data model.
-}
type alias SubmitTaskStateChangeResponse =
    { acknowledgment : Maybe String_ }


{-| The SubmitTaskStateChangeRequest data model.
-}
type alias SubmitTaskStateChangeRequest =
    { attachments : Maybe AttachmentStateChanges
    , cluster : Maybe String_
    , containers : Maybe ContainerStateChanges
    , executionStoppedAt : Maybe Timestamp
    , pullStartedAt : Maybe Timestamp
    , pullStoppedAt : Maybe Timestamp
    , reason : Maybe String_
    , status : Maybe String_
    , task : Maybe String_
    }


{-| The SubmitContainerStateChangeResponse data model.
-}
type alias SubmitContainerStateChangeResponse =
    { acknowledgment : Maybe String_ }


{-| The SubmitContainerStateChangeRequest data model.
-}
type alias SubmitContainerStateChangeRequest =
    { cluster : Maybe String_
    , containerName : Maybe String_
    , exitCode : Maybe BoxedInteger
    , networkBindings : Maybe NetworkBindings
    , reason : Maybe String_
    , status : Maybe String_
    , task : Maybe String_
    }


{-| The SubmitAttachmentStateChangesResponse data model.
-}
type alias SubmitAttachmentStateChangesResponse =
    { acknowledgment : Maybe String_ }


{-| The SubmitAttachmentStateChangesRequest data model.
-}
type alias SubmitAttachmentStateChangesRequest =
    { attachments : AttachmentStateChanges, cluster : Maybe String_ }


{-| The StringMap data model.
-}
type alias StringMap =
    Dict String_ String_


{-| The StringList data model.
-}
type alias StringList =
    List String_


{-| The String\_ data model.
-}
type alias String_ =
    String


{-| The StopTaskResponse data model.
-}
type alias StopTaskResponse =
    { task : Maybe Task }


{-| The StopTaskRequest data model.
-}
type alias StopTaskRequest =
    { cluster : Maybe String_, reason : Maybe String_, task : String_ }


{-| The Statistics data model.
-}
type alias Statistics =
    List KeyValuePair


{-| The StartTaskResponse data model.
-}
type alias StartTaskResponse =
    { failures : Maybe Failures, tasks : Maybe Tasks }


{-| The StartTaskRequest data model.
-}
type alias StartTaskRequest =
    { cluster : Maybe String_
    , containerInstances : StringList
    , enableEcsmanagedTags : Maybe Boolean
    , group : Maybe String_
    , networkConfiguration : Maybe NetworkConfiguration
    , overrides : Maybe TaskOverride
    , propagateTags : Maybe PropagateTags
    , startedBy : Maybe String_
    , tags : Maybe Tags
    , taskDefinition : String_
    }


{-| The StabilityStatus data model.
-}
type StabilityStatus
    = StabilityStatusSteadyState
    | StabilityStatusStabilizing


{-| The StabilityStatus data model.
-}
stabilityStatus : Enum StabilityStatus
stabilityStatus =
    Enum.define
        [ StabilityStatusSteadyState, StabilityStatusStabilizing ]
        (\val ->
            case val of
                StabilityStatusSteadyState ->
                    "STEADY_STATE"

                StabilityStatusStabilizing ->
                    "STABILIZING"
        )


{-| The SortOrder data model.
-}
type SortOrder
    = SortOrderAsc
    | SortOrderDesc


{-| The SortOrder data model.
-}
sortOrder : Enum SortOrder
sortOrder =
    Enum.define
        [ SortOrderAsc, SortOrderDesc ]
        (\val ->
            case val of
                SortOrderAsc ->
                    "ASC"

                SortOrderDesc ->
                    "DESC"
        )


{-| The Settings data model.
-}
type alias Settings =
    List Setting


{-| The SettingName data model.
-}
type SettingName
    = SettingNameServiceLongArnFormat
    | SettingNameTaskLongArnFormat
    | SettingNameContainerInstanceLongArnFormat
    | SettingNameAwsvpcTrunking
    | SettingNameContainerInsights


{-| The SettingName data model.
-}
settingName : Enum SettingName
settingName =
    Enum.define
        [ SettingNameServiceLongArnFormat
        , SettingNameTaskLongArnFormat
        , SettingNameContainerInstanceLongArnFormat
        , SettingNameAwsvpcTrunking
        , SettingNameContainerInsights
        ]
        (\val ->
            case val of
                SettingNameServiceLongArnFormat ->
                    "serviceLongArnFormat"

                SettingNameTaskLongArnFormat ->
                    "taskLongArnFormat"

                SettingNameContainerInstanceLongArnFormat ->
                    "containerInstanceLongArnFormat"

                SettingNameAwsvpcTrunking ->
                    "awsvpcTrunking"

                SettingNameContainerInsights ->
                    "containerInsights"
        )


{-| The Setting data model.
-}
type alias Setting =
    { name : Maybe SettingName, principalArn : Maybe String_, value : Maybe String_ }


{-| The Services data model.
-}
type alias Services =
    List Service


{-| The ServiceRegistry data model.
-}
type alias ServiceRegistry =
    { containerName : Maybe String_
    , containerPort : Maybe BoxedInteger
    , port_ : Maybe BoxedInteger
    , registryArn : Maybe String_
    }


{-| The ServiceRegistries data model.
-}
type alias ServiceRegistries =
    List ServiceRegistry


{-| The ServiceFieldList data model.
-}
type alias ServiceFieldList =
    List ServiceField


{-| The ServiceField data model.
-}
type ServiceField
    = ServiceFieldTags


{-| The ServiceField data model.
-}
serviceField : Enum ServiceField
serviceField =
    Enum.define
        [ ServiceFieldTags ]
        (\val ->
            case val of
                ServiceFieldTags ->
                    "TAGS"
        )


{-| The ServiceEvents data model.
-}
type alias ServiceEvents =
    List ServiceEvent


{-| The ServiceEvent data model.
-}
type alias ServiceEvent =
    { createdAt : Maybe Timestamp, id : Maybe String_, message : Maybe String_ }


{-| The Service data model.
-}
type alias Service =
    { clusterArn : Maybe String_
    , createdAt : Maybe Timestamp
    , createdBy : Maybe String_
    , deploymentConfiguration : Maybe DeploymentConfiguration
    , deploymentController : Maybe DeploymentController
    , deployments : Maybe Deployments
    , desiredCount : Maybe Integer
    , enableEcsmanagedTags : Maybe Boolean
    , events : Maybe ServiceEvents
    , healthCheckGracePeriodSeconds : Maybe BoxedInteger
    , launchType : Maybe LaunchType
    , loadBalancers : Maybe LoadBalancers
    , networkConfiguration : Maybe NetworkConfiguration
    , pendingCount : Maybe Integer
    , placementConstraints : Maybe PlacementConstraints
    , placementStrategy : Maybe PlacementStrategies
    , platformVersion : Maybe String_
    , propagateTags : Maybe PropagateTags
    , roleArn : Maybe String_
    , runningCount : Maybe Integer
    , schedulingStrategy : Maybe SchedulingStrategy
    , serviceArn : Maybe String_
    , serviceName : Maybe String_
    , serviceRegistries : Maybe ServiceRegistries
    , status : Maybe String_
    , tags : Maybe Tags
    , taskDefinition : Maybe String_
    , taskSets : Maybe TaskSets
    }


{-| The SecretList data model.
-}
type alias SecretList =
    List Secret


{-| The Secret data model.
-}
type alias Secret =
    { name : String_, valueFrom : String_ }


{-| The Scope data model.
-}
type Scope
    = ScopeTask
    | ScopeShared


{-| The Scope data model.
-}
scope : Enum Scope
scope =
    Enum.define
        [ ScopeTask, ScopeShared ]
        (\val ->
            case val of
                ScopeTask ->
                    "task"

                ScopeShared ->
                    "shared"
        )


{-| The SchedulingStrategy data model.
-}
type SchedulingStrategy
    = SchedulingStrategyReplica
    | SchedulingStrategyDaemon


{-| The SchedulingStrategy data model.
-}
schedulingStrategy : Enum SchedulingStrategy
schedulingStrategy =
    Enum.define
        [ SchedulingStrategyReplica, SchedulingStrategyDaemon ]
        (\val ->
            case val of
                SchedulingStrategyReplica ->
                    "REPLICA"

                SchedulingStrategyDaemon ->
                    "DAEMON"
        )


{-| The ScaleUnit data model.
-}
type ScaleUnit
    = ScaleUnitPercent


{-| The ScaleUnit data model.
-}
scaleUnit : Enum ScaleUnit
scaleUnit =
    Enum.define
        [ ScaleUnitPercent ]
        (\val ->
            case val of
                ScaleUnitPercent ->
                    "PERCENT"
        )


{-| The Scale data model.
-}
type alias Scale =
    { unit : Maybe ScaleUnit, value : Maybe Double }


{-| The RunTaskResponse data model.
-}
type alias RunTaskResponse =
    { failures : Maybe Failures, tasks : Maybe Tasks }


{-| The RunTaskRequest data model.
-}
type alias RunTaskRequest =
    { cluster : Maybe String_
    , count : Maybe BoxedInteger
    , enableEcsmanagedTags : Maybe Boolean
    , group : Maybe String_
    , launchType : Maybe LaunchType
    , networkConfiguration : Maybe NetworkConfiguration
    , overrides : Maybe TaskOverride
    , placementConstraints : Maybe PlacementConstraints
    , placementStrategy : Maybe PlacementStrategies
    , platformVersion : Maybe String_
    , propagateTags : Maybe PropagateTags
    , startedBy : Maybe String_
    , tags : Maybe Tags
    , taskDefinition : String_
    }


{-| The Resources data model.
-}
type alias Resources =
    List Resource


{-| The ResourceType data model.
-}
type ResourceType
    = ResourceTypeGpu


{-| The ResourceType data model.
-}
resourceType : Enum ResourceType
resourceType =
    Enum.define
        [ ResourceTypeGpu ]
        (\val ->
            case val of
                ResourceTypeGpu ->
                    "GPU"
        )


{-| The ResourceRequirements data model.
-}
type alias ResourceRequirements =
    List ResourceRequirement


{-| The ResourceRequirement data model.
-}
type alias ResourceRequirement =
    { type_ : ResourceType, value : String_ }


{-| The Resource data model.
-}
type alias Resource =
    { doubleValue : Maybe Double
    , integerValue : Maybe Integer
    , longValue : Maybe Long
    , name : Maybe String_
    , stringSetValue : Maybe StringList
    , type_ : Maybe String_
    }


{-| The RequiresAttributes data model.
-}
type alias RequiresAttributes =
    List Attribute


{-| The RepositoryCredentials data model.
-}
type alias RepositoryCredentials =
    { credentialsParameter : String_ }


{-| The RegisterTaskDefinitionResponse data model.
-}
type alias RegisterTaskDefinitionResponse =
    { tags : Maybe Tags, taskDefinition : Maybe TaskDefinition }


{-| The RegisterTaskDefinitionRequest data model.
-}
type alias RegisterTaskDefinitionRequest =
    { containerDefinitions : ContainerDefinitions
    , cpu : Maybe String_
    , executionRoleArn : Maybe String_
    , family : String_
    , ipcMode : Maybe IpcMode
    , memory : Maybe String_
    , networkMode : Maybe NetworkMode
    , pidMode : Maybe PidMode
    , placementConstraints : Maybe TaskDefinitionPlacementConstraints
    , proxyConfiguration : Maybe ProxyConfiguration
    , requiresCompatibilities : Maybe CompatibilityList
    , tags : Maybe Tags
    , taskRoleArn : Maybe String_
    , volumes : Maybe VolumeList
    }


{-| The RegisterContainerInstanceResponse data model.
-}
type alias RegisterContainerInstanceResponse =
    { containerInstance : Maybe ContainerInstance }


{-| The RegisterContainerInstanceRequest data model.
-}
type alias RegisterContainerInstanceRequest =
    { attributes : Maybe Attributes
    , cluster : Maybe String_
    , containerInstanceArn : Maybe String_
    , instanceIdentityDocument : Maybe String_
    , instanceIdentityDocumentSignature : Maybe String_
    , platformDevices : Maybe PlatformDevices
    , tags : Maybe Tags
    , totalResources : Maybe Resources
    , versionInfo : Maybe VersionInfo
    }


{-| The PutAttributesResponse data model.
-}
type alias PutAttributesResponse =
    { attributes : Maybe Attributes }


{-| The PutAttributesRequest data model.
-}
type alias PutAttributesRequest =
    { attributes : Attributes, cluster : Maybe String_ }


{-| The PutAccountSettingResponse data model.
-}
type alias PutAccountSettingResponse =
    { setting : Maybe Setting }


{-| The PutAccountSettingRequest data model.
-}
type alias PutAccountSettingRequest =
    { name : SettingName, principalArn : Maybe String_, value : String_ }


{-| The PutAccountSettingDefaultResponse data model.
-}
type alias PutAccountSettingDefaultResponse =
    { setting : Maybe Setting }


{-| The PutAccountSettingDefaultRequest data model.
-}
type alias PutAccountSettingDefaultRequest =
    { name : SettingName, value : String_ }


{-| The ProxyConfigurationType data model.
-}
type ProxyConfigurationType
    = ProxyConfigurationTypeAppmesh


{-| The ProxyConfigurationType data model.
-}
proxyConfigurationType : Enum ProxyConfigurationType
proxyConfigurationType =
    Enum.define
        [ ProxyConfigurationTypeAppmesh ]
        (\val ->
            case val of
                ProxyConfigurationTypeAppmesh ->
                    "APPMESH"
        )


{-| The ProxyConfigurationProperties data model.
-}
type alias ProxyConfigurationProperties =
    List KeyValuePair


{-| The ProxyConfiguration data model.
-}
type alias ProxyConfiguration =
    { containerName : String_, properties : Maybe ProxyConfigurationProperties, type_ : Maybe ProxyConfigurationType }


{-| The PropagateTags data model.
-}
type PropagateTags
    = PropagateTagsTaskDefinition
    | PropagateTagsService


{-| The PropagateTags data model.
-}
propagateTags : Enum PropagateTags
propagateTags =
    Enum.define
        [ PropagateTagsTaskDefinition, PropagateTagsService ]
        (\val ->
            case val of
                PropagateTagsTaskDefinition ->
                    "TASK_DEFINITION"

                PropagateTagsService ->
                    "SERVICE"
        )


{-| The PortMappingList data model.
-}
type alias PortMappingList =
    List PortMapping


{-| The PortMapping data model.
-}
type alias PortMapping =
    { containerPort : Maybe BoxedInteger, hostPort : Maybe BoxedInteger, protocol : Maybe TransportProtocol }


{-| The PlatformDevices data model.
-}
type alias PlatformDevices =
    List PlatformDevice


{-| The PlatformDeviceType data model.
-}
type PlatformDeviceType
    = PlatformDeviceTypeGpu


{-| The PlatformDeviceType data model.
-}
platformDeviceType : Enum PlatformDeviceType
platformDeviceType =
    Enum.define
        [ PlatformDeviceTypeGpu ]
        (\val ->
            case val of
                PlatformDeviceTypeGpu ->
                    "GPU"
        )


{-| The PlatformDevice data model.
-}
type alias PlatformDevice =
    { id : String_, type_ : PlatformDeviceType }


{-| The PlacementStrategyType data model.
-}
type PlacementStrategyType
    = PlacementStrategyTypeRandom
    | PlacementStrategyTypeSpread
    | PlacementStrategyTypeBinpack


{-| The PlacementStrategyType data model.
-}
placementStrategyType : Enum PlacementStrategyType
placementStrategyType =
    Enum.define
        [ PlacementStrategyTypeRandom, PlacementStrategyTypeSpread, PlacementStrategyTypeBinpack ]
        (\val ->
            case val of
                PlacementStrategyTypeRandom ->
                    "random"

                PlacementStrategyTypeSpread ->
                    "spread"

                PlacementStrategyTypeBinpack ->
                    "binpack"
        )


{-| The PlacementStrategy data model.
-}
type alias PlacementStrategy =
    { field : Maybe String_, type_ : Maybe PlacementStrategyType }


{-| The PlacementStrategies data model.
-}
type alias PlacementStrategies =
    List PlacementStrategy


{-| The PlacementConstraints data model.
-}
type alias PlacementConstraints =
    List PlacementConstraint


{-| The PlacementConstraintType data model.
-}
type PlacementConstraintType
    = PlacementConstraintTypeDistinctInstance
    | PlacementConstraintTypeMemberOf


{-| The PlacementConstraintType data model.
-}
placementConstraintType : Enum PlacementConstraintType
placementConstraintType =
    Enum.define
        [ PlacementConstraintTypeDistinctInstance, PlacementConstraintTypeMemberOf ]
        (\val ->
            case val of
                PlacementConstraintTypeDistinctInstance ->
                    "distinctInstance"

                PlacementConstraintTypeMemberOf ->
                    "memberOf"
        )


{-| The PlacementConstraint data model.
-}
type alias PlacementConstraint =
    { expression : Maybe String_, type_ : Maybe PlacementConstraintType }


{-| The PidMode data model.
-}
type PidMode
    = PidModeHost
    | PidModeTask


{-| The PidMode data model.
-}
pidMode : Enum PidMode
pidMode =
    Enum.define
        [ PidModeHost, PidModeTask ]
        (\val ->
            case val of
                PidModeHost ->
                    "host"

                PidModeTask ->
                    "task"
        )


{-| The NetworkMode data model.
-}
type NetworkMode
    = NetworkModeBridge
    | NetworkModeHost
    | NetworkModeAwsvpc
    | NetworkModeNone


{-| The NetworkMode data model.
-}
networkMode : Enum NetworkMode
networkMode =
    Enum.define
        [ NetworkModeBridge, NetworkModeHost, NetworkModeAwsvpc, NetworkModeNone ]
        (\val ->
            case val of
                NetworkModeBridge ->
                    "bridge"

                NetworkModeHost ->
                    "host"

                NetworkModeAwsvpc ->
                    "awsvpc"

                NetworkModeNone ->
                    "none"
        )


{-| The NetworkInterfaces data model.
-}
type alias NetworkInterfaces =
    List NetworkInterface


{-| The NetworkInterface data model.
-}
type alias NetworkInterface =
    { attachmentId : Maybe String_, ipv6Address : Maybe String_, privateIpv4Address : Maybe String_ }


{-| The NetworkConfiguration data model.
-}
type alias NetworkConfiguration =
    { awsvpcConfiguration : Maybe AwsVpcConfiguration }


{-| The NetworkBindings data model.
-}
type alias NetworkBindings =
    List NetworkBinding


{-| The NetworkBinding data model.
-}
type alias NetworkBinding =
    { bindIp : Maybe String_
    , containerPort : Maybe BoxedInteger
    , hostPort : Maybe BoxedInteger
    , protocol : Maybe TransportProtocol
    }


{-| The MountPointList data model.
-}
type alias MountPointList =
    List MountPoint


{-| The MountPoint data model.
-}
type alias MountPoint =
    { containerPath : Maybe String_, readOnly : Maybe BoxedBoolean, sourceVolume : Maybe String_ }


{-| The Long data model.
-}
type alias Long =
    Int


{-| The LogDriver data model.
-}
type LogDriver
    = LogDriverJsonFile
    | LogDriverSyslog
    | LogDriverJournald
    | LogDriverGelf
    | LogDriverFluentd
    | LogDriverAwslogs
    | LogDriverSplunk


{-| The LogDriver data model.
-}
logDriver : Enum LogDriver
logDriver =
    Enum.define
        [ LogDriverJsonFile
        , LogDriverSyslog
        , LogDriverJournald
        , LogDriverGelf
        , LogDriverFluentd
        , LogDriverAwslogs
        , LogDriverSplunk
        ]
        (\val ->
            case val of
                LogDriverJsonFile ->
                    "json-file"

                LogDriverSyslog ->
                    "syslog"

                LogDriverJournald ->
                    "journald"

                LogDriverGelf ->
                    "gelf"

                LogDriverFluentd ->
                    "fluentd"

                LogDriverAwslogs ->
                    "awslogs"

                LogDriverSplunk ->
                    "splunk"
        )


{-| The LogConfigurationOptionsMap data model.
-}
type alias LogConfigurationOptionsMap =
    Dict String_ String_


{-| The LogConfiguration data model.
-}
type alias LogConfiguration =
    { logDriver : LogDriver, options : Maybe LogConfigurationOptionsMap, secretOptions : Maybe SecretList }


{-| The LoadBalancers data model.
-}
type alias LoadBalancers =
    List LoadBalancer


{-| The LoadBalancer data model.
-}
type alias LoadBalancer =
    { containerName : Maybe String_
    , containerPort : Maybe BoxedInteger
    , loadBalancerName : Maybe String_
    , targetGroupArn : Maybe String_
    }


{-| The ListTasksResponse data model.
-}
type alias ListTasksResponse =
    { nextToken : Maybe String_, taskArns : Maybe StringList }


{-| The ListTasksRequest data model.
-}
type alias ListTasksRequest =
    { cluster : Maybe String_
    , containerInstance : Maybe String_
    , desiredStatus : Maybe DesiredStatus
    , family : Maybe String_
    , launchType : Maybe LaunchType
    , maxResults : Maybe BoxedInteger
    , nextToken : Maybe String_
    , serviceName : Maybe String_
    , startedBy : Maybe String_
    }


{-| The ListTaskDefinitionsResponse data model.
-}
type alias ListTaskDefinitionsResponse =
    { nextToken : Maybe String_, taskDefinitionArns : Maybe StringList }


{-| The ListTaskDefinitionsRequest data model.
-}
type alias ListTaskDefinitionsRequest =
    { familyPrefix : Maybe String_
    , maxResults : Maybe BoxedInteger
    , nextToken : Maybe String_
    , sort : Maybe SortOrder
    , status : Maybe TaskDefinitionStatus
    }


{-| The ListTaskDefinitionFamiliesResponse data model.
-}
type alias ListTaskDefinitionFamiliesResponse =
    { families : Maybe StringList, nextToken : Maybe String_ }


{-| The ListTaskDefinitionFamiliesRequest data model.
-}
type alias ListTaskDefinitionFamiliesRequest =
    { familyPrefix : Maybe String_
    , maxResults : Maybe BoxedInteger
    , nextToken : Maybe String_
    , status : Maybe TaskDefinitionFamilyStatus
    }


{-| The ListTagsForResourceResponse data model.
-}
type alias ListTagsForResourceResponse =
    { tags : Maybe Tags }


{-| The ListTagsForResourceRequest data model.
-}
type alias ListTagsForResourceRequest =
    { resourceArn : String_ }


{-| The ListServicesResponse data model.
-}
type alias ListServicesResponse =
    { nextToken : Maybe String_, serviceArns : Maybe StringList }


{-| The ListServicesRequest data model.
-}
type alias ListServicesRequest =
    { cluster : Maybe String_
    , launchType : Maybe LaunchType
    , maxResults : Maybe BoxedInteger
    , nextToken : Maybe String_
    , schedulingStrategy : Maybe SchedulingStrategy
    }


{-| The ListContainerInstancesResponse data model.
-}
type alias ListContainerInstancesResponse =
    { containerInstanceArns : Maybe StringList, nextToken : Maybe String_ }


{-| The ListContainerInstancesRequest data model.
-}
type alias ListContainerInstancesRequest =
    { cluster : Maybe String_
    , filter : Maybe String_
    , maxResults : Maybe BoxedInteger
    , nextToken : Maybe String_
    , status : Maybe ContainerInstanceStatus
    }


{-| The ListClustersResponse data model.
-}
type alias ListClustersResponse =
    { clusterArns : Maybe StringList, nextToken : Maybe String_ }


{-| The ListClustersRequest data model.
-}
type alias ListClustersRequest =
    { maxResults : Maybe BoxedInteger, nextToken : Maybe String_ }


{-| The ListAttributesResponse data model.
-}
type alias ListAttributesResponse =
    { attributes : Maybe Attributes, nextToken : Maybe String_ }


{-| The ListAttributesRequest data model.
-}
type alias ListAttributesRequest =
    { attributeName : Maybe String_
    , attributeValue : Maybe String_
    , cluster : Maybe String_
    , maxResults : Maybe BoxedInteger
    , nextToken : Maybe String_
    , targetType : TargetType
    }


{-| The ListAccountSettingsResponse data model.
-}
type alias ListAccountSettingsResponse =
    { nextToken : Maybe String_, settings : Maybe Settings }


{-| The ListAccountSettingsRequest data model.
-}
type alias ListAccountSettingsRequest =
    { effectiveSettings : Maybe Boolean
    , maxResults : Maybe Integer
    , name : Maybe SettingName
    , nextToken : Maybe String_
    , principalArn : Maybe String_
    , value : Maybe String_
    }


{-| The LinuxParameters data model.
-}
type alias LinuxParameters =
    { capabilities : Maybe KernelCapabilities
    , devices : Maybe DevicesList
    , initProcessEnabled : Maybe BoxedBoolean
    , sharedMemorySize : Maybe BoxedInteger
    , tmpfs : Maybe TmpfsList
    }


{-| The LaunchType data model.
-}
type LaunchType
    = LaunchTypeEc2
    | LaunchTypeFargate


{-| The LaunchType data model.
-}
launchType : Enum LaunchType
launchType =
    Enum.define
        [ LaunchTypeEc2, LaunchTypeFargate ]
        (\val ->
            case val of
                LaunchTypeEc2 ->
                    "EC2"

                LaunchTypeFargate ->
                    "FARGATE"
        )


{-| The KeyValuePair data model.
-}
type alias KeyValuePair =
    { name : Maybe String_, value : Maybe String_ }


{-| The KernelCapabilities data model.
-}
type alias KernelCapabilities =
    { add : Maybe StringList, drop : Maybe StringList }


{-| The IpcMode data model.
-}
type IpcMode
    = IpcModeHost
    | IpcModeTask
    | IpcModeNone


{-| The IpcMode data model.
-}
ipcMode : Enum IpcMode
ipcMode =
    Enum.define
        [ IpcModeHost, IpcModeTask, IpcModeNone ]
        (\val ->
            case val of
                IpcModeHost ->
                    "host"

                IpcModeTask ->
                    "task"

                IpcModeNone ->
                    "none"
        )


{-| The Integer data model.
-}
type alias Integer =
    Int


{-| The HostVolumeProperties data model.
-}
type alias HostVolumeProperties =
    { sourcePath : Maybe String_ }


{-| The HostEntryList data model.
-}
type alias HostEntryList =
    List HostEntry


{-| The HostEntry data model.
-}
type alias HostEntry =
    { hostname : String_, ipAddress : String_ }


{-| The HealthStatus data model.
-}
type HealthStatus
    = HealthStatusHealthy
    | HealthStatusUnhealthy
    | HealthStatusUnknown


{-| The HealthStatus data model.
-}
healthStatus : Enum HealthStatus
healthStatus =
    Enum.define
        [ HealthStatusHealthy, HealthStatusUnhealthy, HealthStatusUnknown ]
        (\val ->
            case val of
                HealthStatusHealthy ->
                    "HEALTHY"

                HealthStatusUnhealthy ->
                    "UNHEALTHY"

                HealthStatusUnknown ->
                    "UNKNOWN"
        )


{-| The HealthCheck data model.
-}
type alias HealthCheck =
    { command : StringList
    , interval : Maybe BoxedInteger
    , retries : Maybe BoxedInteger
    , startPeriod : Maybe BoxedInteger
    , timeout : Maybe BoxedInteger
    }


{-| The GpuIds data model.
-}
type alias GpuIds =
    List String_


{-| The Failures data model.
-}
type alias Failures =
    List Failure


{-| The Failure data model.
-}
type alias Failure =
    { arn : Maybe String_, reason : Maybe String_ }


{-| The EnvironmentVariables data model.
-}
type alias EnvironmentVariables =
    List KeyValuePair


{-| The Double data model.
-}
type alias Double =
    Float


{-| The DockerVolumeConfiguration data model.
-}
type alias DockerVolumeConfiguration =
    { autoprovision : Maybe BoxedBoolean
    , driver : Maybe String_
    , driverOpts : Maybe StringMap
    , labels : Maybe StringMap
    , scope : Maybe Scope
    }


{-| The DockerLabelsMap data model.
-}
type alias DockerLabelsMap =
    Dict String_ String_


{-| The DiscoverPollEndpointResponse data model.
-}
type alias DiscoverPollEndpointResponse =
    { endpoint : Maybe String_, telemetryEndpoint : Maybe String_ }


{-| The DiscoverPollEndpointRequest data model.
-}
type alias DiscoverPollEndpointRequest =
    { cluster : Maybe String_, containerInstance : Maybe String_ }


{-| The DevicesList data model.
-}
type alias DevicesList =
    List Device


{-| The DeviceCgroupPermissions data model.
-}
type alias DeviceCgroupPermissions =
    List DeviceCgroupPermission


{-| The DeviceCgroupPermission data model.
-}
type DeviceCgroupPermission
    = DeviceCgroupPermissionRead
    | DeviceCgroupPermissionWrite
    | DeviceCgroupPermissionMknod


{-| The DeviceCgroupPermission data model.
-}
deviceCgroupPermission : Enum DeviceCgroupPermission
deviceCgroupPermission =
    Enum.define
        [ DeviceCgroupPermissionRead, DeviceCgroupPermissionWrite, DeviceCgroupPermissionMknod ]
        (\val ->
            case val of
                DeviceCgroupPermissionRead ->
                    "read"

                DeviceCgroupPermissionWrite ->
                    "write"

                DeviceCgroupPermissionMknod ->
                    "mknod"
        )


{-| The Device data model.
-}
type alias Device =
    { containerPath : Maybe String_, hostPath : String_, permissions : Maybe DeviceCgroupPermissions }


{-| The DesiredStatus data model.
-}
type DesiredStatus
    = DesiredStatusRunning
    | DesiredStatusPending
    | DesiredStatusStopped


{-| The DesiredStatus data model.
-}
desiredStatus : Enum DesiredStatus
desiredStatus =
    Enum.define
        [ DesiredStatusRunning, DesiredStatusPending, DesiredStatusStopped ]
        (\val ->
            case val of
                DesiredStatusRunning ->
                    "RUNNING"

                DesiredStatusPending ->
                    "PENDING"

                DesiredStatusStopped ->
                    "STOPPED"
        )


{-| The DescribeTasksResponse data model.
-}
type alias DescribeTasksResponse =
    { failures : Maybe Failures, tasks : Maybe Tasks }


{-| The DescribeTasksRequest data model.
-}
type alias DescribeTasksRequest =
    { cluster : Maybe String_, include : Maybe TaskFieldList, tasks : StringList }


{-| The DescribeTaskSetsResponse data model.
-}
type alias DescribeTaskSetsResponse =
    { failures : Maybe Failures, taskSets : Maybe TaskSets }


{-| The DescribeTaskSetsRequest data model.
-}
type alias DescribeTaskSetsRequest =
    { cluster : String_, service : String_, taskSets : Maybe StringList }


{-| The DescribeTaskDefinitionResponse data model.
-}
type alias DescribeTaskDefinitionResponse =
    { tags : Maybe Tags, taskDefinition : Maybe TaskDefinition }


{-| The DescribeTaskDefinitionRequest data model.
-}
type alias DescribeTaskDefinitionRequest =
    { include : Maybe TaskDefinitionFieldList, taskDefinition : String_ }


{-| The DescribeServicesResponse data model.
-}
type alias DescribeServicesResponse =
    { failures : Maybe Failures, services : Maybe Services }


{-| The DescribeServicesRequest data model.
-}
type alias DescribeServicesRequest =
    { cluster : Maybe String_, include : Maybe ServiceFieldList, services : StringList }


{-| The DescribeContainerInstancesResponse data model.
-}
type alias DescribeContainerInstancesResponse =
    { containerInstances : Maybe ContainerInstances, failures : Maybe Failures }


{-| The DescribeContainerInstancesRequest data model.
-}
type alias DescribeContainerInstancesRequest =
    { cluster : Maybe String_, containerInstances : StringList, include : Maybe ContainerInstanceFieldList }


{-| The DescribeClustersResponse data model.
-}
type alias DescribeClustersResponse =
    { clusters : Maybe Clusters, failures : Maybe Failures }


{-| The DescribeClustersRequest data model.
-}
type alias DescribeClustersRequest =
    { clusters : Maybe StringList, include : Maybe ClusterFieldList }


{-| The DeregisterTaskDefinitionResponse data model.
-}
type alias DeregisterTaskDefinitionResponse =
    { taskDefinition : Maybe TaskDefinition }


{-| The DeregisterTaskDefinitionRequest data model.
-}
type alias DeregisterTaskDefinitionRequest =
    { taskDefinition : String_ }


{-| The DeregisterContainerInstanceResponse data model.
-}
type alias DeregisterContainerInstanceResponse =
    { containerInstance : Maybe ContainerInstance }


{-| The DeregisterContainerInstanceRequest data model.
-}
type alias DeregisterContainerInstanceRequest =
    { cluster : Maybe String_, containerInstance : String_, force : Maybe BoxedBoolean }


{-| The Deployments data model.
-}
type alias Deployments =
    List Deployment


{-| The DeploymentControllerType data model.
-}
type DeploymentControllerType
    = DeploymentControllerTypeEcs
    | DeploymentControllerTypeCodeDeploy
    | DeploymentControllerTypeExternal


{-| The DeploymentControllerType data model.
-}
deploymentControllerType : Enum DeploymentControllerType
deploymentControllerType =
    Enum.define
        [ DeploymentControllerTypeEcs, DeploymentControllerTypeCodeDeploy, DeploymentControllerTypeExternal ]
        (\val ->
            case val of
                DeploymentControllerTypeEcs ->
                    "ECS"

                DeploymentControllerTypeCodeDeploy ->
                    "CODE_DEPLOY"

                DeploymentControllerTypeExternal ->
                    "EXTERNAL"
        )


{-| The DeploymentController data model.
-}
type alias DeploymentController =
    { type_ : DeploymentControllerType }


{-| The DeploymentConfiguration data model.
-}
type alias DeploymentConfiguration =
    { maximumPercent : Maybe BoxedInteger, minimumHealthyPercent : Maybe BoxedInteger }


{-| The Deployment data model.
-}
type alias Deployment =
    { createdAt : Maybe Timestamp
    , desiredCount : Maybe Integer
    , id : Maybe String_
    , launchType : Maybe LaunchType
    , networkConfiguration : Maybe NetworkConfiguration
    , pendingCount : Maybe Integer
    , platformVersion : Maybe String_
    , runningCount : Maybe Integer
    , status : Maybe String_
    , taskDefinition : Maybe String_
    , updatedAt : Maybe Timestamp
    }


{-| The DeleteTaskSetResponse data model.
-}
type alias DeleteTaskSetResponse =
    { taskSet : Maybe TaskSet }


{-| The DeleteTaskSetRequest data model.
-}
type alias DeleteTaskSetRequest =
    { cluster : String_, force : Maybe BoxedBoolean, service : String_, taskSet : String_ }


{-| The DeleteServiceResponse data model.
-}
type alias DeleteServiceResponse =
    { service : Maybe Service }


{-| The DeleteServiceRequest data model.
-}
type alias DeleteServiceRequest =
    { cluster : Maybe String_, force : Maybe BoxedBoolean, service : String_ }


{-| The DeleteClusterResponse data model.
-}
type alias DeleteClusterResponse =
    { cluster : Maybe Cluster }


{-| The DeleteClusterRequest data model.
-}
type alias DeleteClusterRequest =
    { cluster : String_ }


{-| The DeleteAttributesResponse data model.
-}
type alias DeleteAttributesResponse =
    { attributes : Maybe Attributes }


{-| The DeleteAttributesRequest data model.
-}
type alias DeleteAttributesRequest =
    { attributes : Attributes, cluster : Maybe String_ }


{-| The DeleteAccountSettingResponse data model.
-}
type alias DeleteAccountSettingResponse =
    { setting : Maybe Setting }


{-| The DeleteAccountSettingRequest data model.
-}
type alias DeleteAccountSettingRequest =
    { name : SettingName, principalArn : Maybe String_ }


{-| The CreateTaskSetResponse data model.
-}
type alias CreateTaskSetResponse =
    { taskSet : Maybe TaskSet }


{-| The CreateTaskSetRequest data model.
-}
type alias CreateTaskSetRequest =
    { clientToken : Maybe String_
    , cluster : String_
    , externalId : Maybe String_
    , launchType : Maybe LaunchType
    , loadBalancers : Maybe LoadBalancers
    , networkConfiguration : Maybe NetworkConfiguration
    , platformVersion : Maybe String_
    , scale : Maybe Scale
    , service : String_
    , serviceRegistries : Maybe ServiceRegistries
    , taskDefinition : String_
    }


{-| The CreateServiceResponse data model.
-}
type alias CreateServiceResponse =
    { service : Maybe Service }


{-| The CreateServiceRequest data model.
-}
type alias CreateServiceRequest =
    { clientToken : Maybe String_
    , cluster : Maybe String_
    , deploymentConfiguration : Maybe DeploymentConfiguration
    , deploymentController : Maybe DeploymentController
    , desiredCount : Maybe BoxedInteger
    , enableEcsmanagedTags : Maybe Boolean
    , healthCheckGracePeriodSeconds : Maybe BoxedInteger
    , launchType : Maybe LaunchType
    , loadBalancers : Maybe LoadBalancers
    , networkConfiguration : Maybe NetworkConfiguration
    , placementConstraints : Maybe PlacementConstraints
    , placementStrategy : Maybe PlacementStrategies
    , platformVersion : Maybe String_
    , propagateTags : Maybe PropagateTags
    , role : Maybe String_
    , schedulingStrategy : Maybe SchedulingStrategy
    , serviceName : String_
    , serviceRegistries : Maybe ServiceRegistries
    , tags : Maybe Tags
    , taskDefinition : Maybe String_
    }


{-| The CreateClusterResponse data model.
-}
type alias CreateClusterResponse =
    { cluster : Maybe Cluster }


{-| The CreateClusterRequest data model.
-}
type alias CreateClusterRequest =
    { clusterName : Maybe String_, settings : Maybe ClusterSettings, tags : Maybe Tags }


{-| The Containers data model.
-}
type alias Containers =
    List Container


{-| The ContainerStateChanges data model.
-}
type alias ContainerStateChanges =
    List ContainerStateChange


{-| The ContainerStateChange data model.
-}
type alias ContainerStateChange =
    { containerName : Maybe String_
    , exitCode : Maybe BoxedInteger
    , networkBindings : Maybe NetworkBindings
    , reason : Maybe String_
    , status : Maybe String_
    }


{-| The ContainerOverrides data model.
-}
type alias ContainerOverrides =
    List ContainerOverride


{-| The ContainerOverride data model.
-}
type alias ContainerOverride =
    { command : Maybe StringList
    , cpu : Maybe BoxedInteger
    , environment : Maybe EnvironmentVariables
    , memory : Maybe BoxedInteger
    , memoryReservation : Maybe BoxedInteger
    , name : Maybe String_
    , resourceRequirements : Maybe ResourceRequirements
    }


{-| The ContainerInstances data model.
-}
type alias ContainerInstances =
    List ContainerInstance


{-| The ContainerInstanceStatus data model.
-}
type ContainerInstanceStatus
    = ContainerInstanceStatusActive
    | ContainerInstanceStatusDraining
    | ContainerInstanceStatusRegistering
    | ContainerInstanceStatusDeregistering
    | ContainerInstanceStatusRegistrationFailed


{-| The ContainerInstanceStatus data model.
-}
containerInstanceStatus : Enum ContainerInstanceStatus
containerInstanceStatus =
    Enum.define
        [ ContainerInstanceStatusActive
        , ContainerInstanceStatusDraining
        , ContainerInstanceStatusRegistering
        , ContainerInstanceStatusDeregistering
        , ContainerInstanceStatusRegistrationFailed
        ]
        (\val ->
            case val of
                ContainerInstanceStatusActive ->
                    "ACTIVE"

                ContainerInstanceStatusDraining ->
                    "DRAINING"

                ContainerInstanceStatusRegistering ->
                    "REGISTERING"

                ContainerInstanceStatusDeregistering ->
                    "DEREGISTERING"

                ContainerInstanceStatusRegistrationFailed ->
                    "REGISTRATION_FAILED"
        )


{-| The ContainerInstanceFieldList data model.
-}
type alias ContainerInstanceFieldList =
    List ContainerInstanceField


{-| The ContainerInstanceField data model.
-}
type ContainerInstanceField
    = ContainerInstanceFieldTags


{-| The ContainerInstanceField data model.
-}
containerInstanceField : Enum ContainerInstanceField
containerInstanceField =
    Enum.define
        [ ContainerInstanceFieldTags ]
        (\val ->
            case val of
                ContainerInstanceFieldTags ->
                    "TAGS"
        )


{-| The ContainerInstance data model.
-}
type alias ContainerInstance =
    { agentConnected : Maybe Boolean
    , agentUpdateStatus : Maybe AgentUpdateStatus
    , attachments : Maybe Attachments
    , attributes : Maybe Attributes
    , containerInstanceArn : Maybe String_
    , ec2InstanceId : Maybe String_
    , pendingTasksCount : Maybe Integer
    , registeredAt : Maybe Timestamp
    , registeredResources : Maybe Resources
    , remainingResources : Maybe Resources
    , runningTasksCount : Maybe Integer
    , status : Maybe String_
    , statusReason : Maybe String_
    , tags : Maybe Tags
    , version : Maybe Long
    , versionInfo : Maybe VersionInfo
    }


{-| The ContainerDependency data model.
-}
type alias ContainerDependency =
    { condition : ContainerCondition, containerName : String_ }


{-| The ContainerDependencies data model.
-}
type alias ContainerDependencies =
    List ContainerDependency


{-| The ContainerDefinitions data model.
-}
type alias ContainerDefinitions =
    List ContainerDefinition


{-| The ContainerDefinition data model.
-}
type alias ContainerDefinition =
    { command : Maybe StringList
    , cpu : Maybe Integer
    , dependsOn : Maybe ContainerDependencies
    , disableNetworking : Maybe BoxedBoolean
    , dnsSearchDomains : Maybe StringList
    , dnsServers : Maybe StringList
    , dockerLabels : Maybe DockerLabelsMap
    , dockerSecurityOptions : Maybe StringList
    , entryPoint : Maybe StringList
    , environment : Maybe EnvironmentVariables
    , essential : Maybe BoxedBoolean
    , extraHosts : Maybe HostEntryList
    , healthCheck : Maybe HealthCheck
    , hostname : Maybe String_
    , image : Maybe String_
    , interactive : Maybe BoxedBoolean
    , links : Maybe StringList
    , linuxParameters : Maybe LinuxParameters
    , logConfiguration : Maybe LogConfiguration
    , memory : Maybe BoxedInteger
    , memoryReservation : Maybe BoxedInteger
    , mountPoints : Maybe MountPointList
    , name : Maybe String_
    , portMappings : Maybe PortMappingList
    , privileged : Maybe BoxedBoolean
    , pseudoTerminal : Maybe BoxedBoolean
    , readonlyRootFilesystem : Maybe BoxedBoolean
    , repositoryCredentials : Maybe RepositoryCredentials
    , resourceRequirements : Maybe ResourceRequirements
    , secrets : Maybe SecretList
    , startTimeout : Maybe BoxedInteger
    , stopTimeout : Maybe BoxedInteger
    , systemControls : Maybe SystemControls
    , ulimits : Maybe UlimitList
    , user : Maybe String_
    , volumesFrom : Maybe VolumeFromList
    , workingDirectory : Maybe String_
    }


{-| The ContainerCondition data model.
-}
type ContainerCondition
    = ContainerConditionStart
    | ContainerConditionComplete
    | ContainerConditionSuccess
    | ContainerConditionHealthy


{-| The ContainerCondition data model.
-}
containerCondition : Enum ContainerCondition
containerCondition =
    Enum.define
        [ ContainerConditionStart, ContainerConditionComplete, ContainerConditionSuccess, ContainerConditionHealthy ]
        (\val ->
            case val of
                ContainerConditionStart ->
                    "START"

                ContainerConditionComplete ->
                    "COMPLETE"

                ContainerConditionSuccess ->
                    "SUCCESS"

                ContainerConditionHealthy ->
                    "HEALTHY"
        )


{-| The Container data model.
-}
type alias Container =
    { containerArn : Maybe String_
    , cpu : Maybe String_
    , exitCode : Maybe BoxedInteger
    , gpuIds : Maybe GpuIds
    , healthStatus : Maybe HealthStatus
    , lastStatus : Maybe String_
    , memory : Maybe String_
    , memoryReservation : Maybe String_
    , name : Maybe String_
    , networkBindings : Maybe NetworkBindings
    , networkInterfaces : Maybe NetworkInterfaces
    , reason : Maybe String_
    , taskArn : Maybe String_
    }


{-| The Connectivity data model.
-}
type Connectivity
    = ConnectivityConnected
    | ConnectivityDisconnected


{-| The Connectivity data model.
-}
connectivity : Enum Connectivity
connectivity =
    Enum.define
        [ ConnectivityConnected, ConnectivityDisconnected ]
        (\val ->
            case val of
                ConnectivityConnected ->
                    "CONNECTED"

                ConnectivityDisconnected ->
                    "DISCONNECTED"
        )


{-| The CompatibilityList data model.
-}
type alias CompatibilityList =
    List Compatibility


{-| The Compatibility data model.
-}
type Compatibility
    = CompatibilityEc2
    | CompatibilityFargate


{-| The Compatibility data model.
-}
compatibility : Enum Compatibility
compatibility =
    Enum.define
        [ CompatibilityEc2, CompatibilityFargate ]
        (\val ->
            case val of
                CompatibilityEc2 ->
                    "EC2"

                CompatibilityFargate ->
                    "FARGATE"
        )


{-| The Clusters data model.
-}
type alias Clusters =
    List Cluster


{-| The ClusterSettings data model.
-}
type alias ClusterSettings =
    List ClusterSetting


{-| The ClusterSettingName data model.
-}
type ClusterSettingName
    = ClusterSettingNameContainerInsights


{-| The ClusterSettingName data model.
-}
clusterSettingName : Enum ClusterSettingName
clusterSettingName =
    Enum.define
        [ ClusterSettingNameContainerInsights ]
        (\val ->
            case val of
                ClusterSettingNameContainerInsights ->
                    "containerInsights"
        )


{-| The ClusterSetting data model.
-}
type alias ClusterSetting =
    { name : Maybe ClusterSettingName, value : Maybe String_ }


{-| The ClusterFieldList data model.
-}
type alias ClusterFieldList =
    List ClusterField


{-| The ClusterField data model.
-}
type ClusterField
    = ClusterFieldStatistics
    | ClusterFieldTags


{-| The ClusterField data model.
-}
clusterField : Enum ClusterField
clusterField =
    Enum.define
        [ ClusterFieldStatistics, ClusterFieldTags ]
        (\val ->
            case val of
                ClusterFieldStatistics ->
                    "STATISTICS"

                ClusterFieldTags ->
                    "TAGS"
        )


{-| The Cluster data model.
-}
type alias Cluster =
    { activeServicesCount : Maybe Integer
    , clusterArn : Maybe String_
    , clusterName : Maybe String_
    , pendingTasksCount : Maybe Integer
    , registeredContainerInstancesCount : Maybe Integer
    , runningTasksCount : Maybe Integer
    , settings : Maybe ClusterSettings
    , statistics : Maybe Statistics
    , status : Maybe String_
    , tags : Maybe Tags
    }


{-| The BoxedInteger data model.
-}
type alias BoxedInteger =
    Int


{-| The BoxedBoolean data model.
-}
type alias BoxedBoolean =
    Bool


{-| The Boolean data model.
-}
type alias Boolean =
    Bool


{-| The AwsVpcConfiguration data model.
-}
type alias AwsVpcConfiguration =
    { assignPublicIp : Maybe AssignPublicIp, securityGroups : Maybe StringList, subnets : StringList }


{-| The Attributes data model.
-}
type alias Attributes =
    List Attribute


{-| The Attribute data model.
-}
type alias Attribute =
    { name : String_, targetId : Maybe String_, targetType : Maybe TargetType, value : Maybe String_ }


{-| The Attachments data model.
-}
type alias Attachments =
    List Attachment


{-| The AttachmentStateChanges data model.
-}
type alias AttachmentStateChanges =
    List AttachmentStateChange


{-| The AttachmentStateChange data model.
-}
type alias AttachmentStateChange =
    { attachmentArn : String_, status : String_ }


{-| The AttachmentDetails data model.
-}
type alias AttachmentDetails =
    List KeyValuePair


{-| The Attachment data model.
-}
type alias Attachment =
    { details : Maybe AttachmentDetails, id : Maybe String_, status : Maybe String_, type_ : Maybe String_ }


{-| The AssignPublicIp data model.
-}
type AssignPublicIp
    = AssignPublicIpEnabled
    | AssignPublicIpDisabled


{-| The AssignPublicIp data model.
-}
assignPublicIp : Enum AssignPublicIp
assignPublicIp =
    Enum.define
        [ AssignPublicIpEnabled, AssignPublicIpDisabled ]
        (\val ->
            case val of
                AssignPublicIpEnabled ->
                    "ENABLED"

                AssignPublicIpDisabled ->
                    "DISABLED"
        )


{-| The AgentUpdateStatus data model.
-}
type AgentUpdateStatus
    = AgentUpdateStatusPending
    | AgentUpdateStatusStaging
    | AgentUpdateStatusStaged
    | AgentUpdateStatusUpdating
    | AgentUpdateStatusUpdated
    | AgentUpdateStatusFailed


{-| The AgentUpdateStatus data model.
-}
agentUpdateStatus : Enum AgentUpdateStatus
agentUpdateStatus =
    Enum.define
        [ AgentUpdateStatusPending
        , AgentUpdateStatusStaging
        , AgentUpdateStatusStaged
        , AgentUpdateStatusUpdating
        , AgentUpdateStatusUpdated
        , AgentUpdateStatusFailed
        ]
        (\val ->
            case val of
                AgentUpdateStatusPending ->
                    "PENDING"

                AgentUpdateStatusStaging ->
                    "STAGING"

                AgentUpdateStatusStaged ->
                    "STAGED"

                AgentUpdateStatusUpdating ->
                    "UPDATING"

                AgentUpdateStatusUpdated ->
                    "UPDATED"

                AgentUpdateStatusFailed ->
                    "FAILED"
        )


{-| Decoder for AgentUpdateStatus.
-}
agentUpdateStatusDecoder : Decoder AgentUpdateStatus
agentUpdateStatusDecoder =
    Enum.decoder agentUpdateStatus


{-| Codec for AssignPublicIp.
-}
assignPublicIpCodec : Codec AssignPublicIp
assignPublicIpCodec =
    Codec.build (Enum.encoder assignPublicIp) (Enum.decoder assignPublicIp)


{-| Decoder for Attachment.
-}
attachmentDecoder : Decoder Attachment
attachmentDecoder =
    Json.Decode.succeed Attachment
        |> Pipeline.optional "details" (Json.Decode.maybe attachmentDetailsDecoder) Nothing
        |> Pipeline.optional "id" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "status" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "type" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing


{-| Decoder for AttachmentDetails.
-}
attachmentDetailsDecoder : Decoder AttachmentDetails
attachmentDetailsDecoder =
    Json.Decode.list (Codec.decoder keyValuePairCodec)


{-| Encoder for AttachmentStateChange.
-}
attachmentStateChangeEncoder : AttachmentStateChange -> Value
attachmentStateChangeEncoder val =
    [ ( "attachmentArn", val.attachmentArn ) |> EncodeOpt.field (Codec.encoder stringCodec)
    , ( "status", val.status ) |> EncodeOpt.field (Codec.encoder stringCodec)
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for AttachmentStateChanges.
-}
attachmentStateChangesEncoder : AttachmentStateChanges -> Value
attachmentStateChangesEncoder val =
    Json.Encode.list attachmentStateChangeEncoder val


{-| Decoder for Attachments.
-}
attachmentsDecoder : Decoder Attachments
attachmentsDecoder =
    Json.Decode.list attachmentDecoder


{-| Codec for Attribute.
-}
attributeCodec : Codec Attribute
attributeCodec =
    Codec.object Attribute
        |> Codec.field "name" .name stringCodec
        |> Codec.optionalField "targetId" .targetId stringCodec
        |> Codec.optionalField "targetType" .targetType targetTypeCodec
        |> Codec.optionalField "value" .value stringCodec
        |> Codec.buildObject


{-| Codec for Attributes.
-}
attributesCodec : Codec Attributes
attributesCodec =
    Codec.list attributeCodec


{-| Codec for AwsVpcConfiguration.
-}
awsVpcConfigurationCodec : Codec AwsVpcConfiguration
awsVpcConfigurationCodec =
    Codec.object AwsVpcConfiguration
        |> Codec.optionalField "assignPublicIp" .assignPublicIp assignPublicIpCodec
        |> Codec.optionalField "securityGroups" .securityGroups stringListCodec
        |> Codec.field "subnets" .subnets stringListCodec
        |> Codec.buildObject


{-| Codec for Boolean.
-}
booleanCodec : Codec Boolean
booleanCodec =
    Codec.bool


{-| Codec for BoxedBoolean.
-}
boxedBooleanCodec : Codec BoxedBoolean
boxedBooleanCodec =
    Codec.bool


{-| Codec for BoxedInteger.
-}
boxedIntegerCodec : Codec BoxedInteger
boxedIntegerCodec =
    Codec.int


{-| Decoder for Cluster.
-}
clusterDecoder : Decoder Cluster
clusterDecoder =
    Json.Decode.succeed Cluster
        |> Pipeline.optional "activeServicesCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional "clusterArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "clusterName" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "pendingTasksCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional
            "registeredContainerInstancesCount"
            (Json.Decode.maybe (Codec.decoder integerCodec))
            Nothing
        |> Pipeline.optional "runningTasksCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional "settings" (Json.Decode.maybe (Codec.decoder clusterSettingsCodec)) Nothing
        |> Pipeline.optional "statistics" (Json.Decode.maybe statisticsDecoder) Nothing
        |> Pipeline.optional "status" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "tags" (Json.Decode.maybe (Codec.decoder tagsCodec)) Nothing


{-| Encoder for ClusterField.
-}
clusterFieldEncoder : ClusterField -> Value
clusterFieldEncoder =
    Enum.encoder clusterField


{-| Encoder for ClusterFieldList.
-}
clusterFieldListEncoder : ClusterFieldList -> Value
clusterFieldListEncoder val =
    Json.Encode.list clusterFieldEncoder val


{-| Codec for ClusterSetting.
-}
clusterSettingCodec : Codec ClusterSetting
clusterSettingCodec =
    Codec.object ClusterSetting
        |> Codec.optionalField "name" .name clusterSettingNameCodec
        |> Codec.optionalField "value" .value stringCodec
        |> Codec.buildObject


{-| Codec for ClusterSettingName.
-}
clusterSettingNameCodec : Codec ClusterSettingName
clusterSettingNameCodec =
    Codec.build (Enum.encoder clusterSettingName) (Enum.decoder clusterSettingName)


{-| Codec for ClusterSettings.
-}
clusterSettingsCodec : Codec ClusterSettings
clusterSettingsCodec =
    Codec.list clusterSettingCodec


{-| Decoder for Clusters.
-}
clustersDecoder : Decoder Clusters
clustersDecoder =
    Json.Decode.list clusterDecoder


{-| Codec for Compatibility.
-}
compatibilityCodec : Codec Compatibility
compatibilityCodec =
    Codec.build (Enum.encoder compatibility) (Enum.decoder compatibility)


{-| Codec for CompatibilityList.
-}
compatibilityListCodec : Codec CompatibilityList
compatibilityListCodec =
    Codec.list compatibilityCodec


{-| Decoder for Connectivity.
-}
connectivityDecoder : Decoder Connectivity
connectivityDecoder =
    Enum.decoder connectivity


{-| Decoder for Container.
-}
containerDecoder : Decoder Container
containerDecoder =
    Json.Decode.succeed Container
        |> Pipeline.optional "containerArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "cpu" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "exitCode" (Json.Decode.maybe (Codec.decoder boxedIntegerCodec)) Nothing
        |> Pipeline.optional "gpuIds" (Json.Decode.maybe gpuIdsDecoder) Nothing
        |> Pipeline.optional "healthStatus" (Json.Decode.maybe healthStatusDecoder) Nothing
        |> Pipeline.optional "lastStatus" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "memory" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "memoryReservation" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "name" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "networkBindings" (Json.Decode.maybe (Codec.decoder networkBindingsCodec)) Nothing
        |> Pipeline.optional "networkInterfaces" (Json.Decode.maybe networkInterfacesDecoder) Nothing
        |> Pipeline.optional "reason" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "taskArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing


{-| Codec for ContainerCondition.
-}
containerConditionCodec : Codec ContainerCondition
containerConditionCodec =
    Codec.build (Enum.encoder containerCondition) (Enum.decoder containerCondition)


{-| Codec for ContainerDefinition.
-}
containerDefinitionCodec : Codec ContainerDefinition
containerDefinitionCodec =
    Codec.object ContainerDefinition
        |> Codec.optionalField "command" .command stringListCodec
        |> Codec.optionalField "cpu" .cpu integerCodec
        |> Codec.optionalField "dependsOn" .dependsOn containerDependenciesCodec
        |> Codec.optionalField "disableNetworking" .disableNetworking boxedBooleanCodec
        |> Codec.optionalField "dnsSearchDomains" .dnsSearchDomains stringListCodec
        |> Codec.optionalField "dnsServers" .dnsServers stringListCodec
        |> Codec.optionalField "dockerLabels" .dockerLabels dockerLabelsMapCodec
        |> Codec.optionalField "dockerSecurityOptions" .dockerSecurityOptions stringListCodec
        |> Codec.optionalField "entryPoint" .entryPoint stringListCodec
        |> Codec.optionalField "environment" .environment environmentVariablesCodec
        |> Codec.optionalField "essential" .essential boxedBooleanCodec
        |> Codec.optionalField "extraHosts" .extraHosts hostEntryListCodec
        |> Codec.optionalField "healthCheck" .healthCheck healthCheckCodec
        |> Codec.optionalField "hostname" .hostname stringCodec
        |> Codec.optionalField "image" .image stringCodec
        |> Codec.optionalField "interactive" .interactive boxedBooleanCodec
        |> Codec.optionalField "links" .links stringListCodec
        |> Codec.optionalField "linuxParameters" .linuxParameters linuxParametersCodec
        |> Codec.optionalField "logConfiguration" .logConfiguration logConfigurationCodec
        |> Codec.optionalField "memory" .memory boxedIntegerCodec
        |> Codec.optionalField "memoryReservation" .memoryReservation boxedIntegerCodec
        |> Codec.optionalField "mountPoints" .mountPoints mountPointListCodec
        |> Codec.optionalField "name" .name stringCodec
        |> Codec.optionalField "portMappings" .portMappings portMappingListCodec
        |> Codec.optionalField "privileged" .privileged boxedBooleanCodec
        |> Codec.optionalField "pseudoTerminal" .pseudoTerminal boxedBooleanCodec
        |> Codec.optionalField "readonlyRootFilesystem" .readonlyRootFilesystem boxedBooleanCodec
        |> Codec.optionalField "repositoryCredentials" .repositoryCredentials repositoryCredentialsCodec
        |> Codec.optionalField "resourceRequirements" .resourceRequirements resourceRequirementsCodec
        |> Codec.optionalField "secrets" .secrets secretListCodec
        |> Codec.optionalField "startTimeout" .startTimeout boxedIntegerCodec
        |> Codec.optionalField "stopTimeout" .stopTimeout boxedIntegerCodec
        |> Codec.optionalField "systemControls" .systemControls systemControlsCodec
        |> Codec.optionalField "ulimits" .ulimits ulimitListCodec
        |> Codec.optionalField "user" .user stringCodec
        |> Codec.optionalField "volumesFrom" .volumesFrom volumeFromListCodec
        |> Codec.optionalField "workingDirectory" .workingDirectory stringCodec
        |> Codec.buildObject


{-| Codec for ContainerDefinitions.
-}
containerDefinitionsCodec : Codec ContainerDefinitions
containerDefinitionsCodec =
    Codec.list containerDefinitionCodec


{-| Codec for ContainerDependencies.
-}
containerDependenciesCodec : Codec ContainerDependencies
containerDependenciesCodec =
    Codec.list containerDependencyCodec


{-| Codec for ContainerDependency.
-}
containerDependencyCodec : Codec ContainerDependency
containerDependencyCodec =
    Codec.object ContainerDependency
        |> Codec.field "condition" .condition containerConditionCodec
        |> Codec.field "containerName" .containerName stringCodec
        |> Codec.buildObject


{-| Decoder for ContainerInstance.
-}
containerInstanceDecoder : Decoder ContainerInstance
containerInstanceDecoder =
    Json.Decode.succeed ContainerInstance
        |> Pipeline.optional "agentConnected" (Json.Decode.maybe (Codec.decoder booleanCodec)) Nothing
        |> Pipeline.optional "agentUpdateStatus" (Json.Decode.maybe agentUpdateStatusDecoder) Nothing
        |> Pipeline.optional "attachments" (Json.Decode.maybe attachmentsDecoder) Nothing
        |> Pipeline.optional "attributes" (Json.Decode.maybe (Codec.decoder attributesCodec)) Nothing
        |> Pipeline.optional "containerInstanceArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "ec2InstanceId" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "pendingTasksCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional "registeredAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "registeredResources" (Json.Decode.maybe (Codec.decoder resourcesCodec)) Nothing
        |> Pipeline.optional "remainingResources" (Json.Decode.maybe (Codec.decoder resourcesCodec)) Nothing
        |> Pipeline.optional "runningTasksCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional "status" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "statusReason" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "tags" (Json.Decode.maybe (Codec.decoder tagsCodec)) Nothing
        |> Pipeline.optional "version" (Json.Decode.maybe (Codec.decoder longCodec)) Nothing
        |> Pipeline.optional "versionInfo" (Json.Decode.maybe (Codec.decoder versionInfoCodec)) Nothing


{-| Encoder for ContainerInstanceField.
-}
containerInstanceFieldEncoder : ContainerInstanceField -> Value
containerInstanceFieldEncoder =
    Enum.encoder containerInstanceField


{-| Encoder for ContainerInstanceFieldList.
-}
containerInstanceFieldListEncoder : ContainerInstanceFieldList -> Value
containerInstanceFieldListEncoder val =
    Json.Encode.list containerInstanceFieldEncoder val


{-| Encoder for ContainerInstanceStatus.
-}
containerInstanceStatusEncoder : ContainerInstanceStatus -> Value
containerInstanceStatusEncoder =
    Enum.encoder containerInstanceStatus


{-| Decoder for ContainerInstances.
-}
containerInstancesDecoder : Decoder ContainerInstances
containerInstancesDecoder =
    Json.Decode.list containerInstanceDecoder


{-| Codec for ContainerOverride.
-}
containerOverrideCodec : Codec ContainerOverride
containerOverrideCodec =
    Codec.object ContainerOverride
        |> Codec.optionalField "command" .command stringListCodec
        |> Codec.optionalField "cpu" .cpu boxedIntegerCodec
        |> Codec.optionalField "environment" .environment environmentVariablesCodec
        |> Codec.optionalField "memory" .memory boxedIntegerCodec
        |> Codec.optionalField "memoryReservation" .memoryReservation boxedIntegerCodec
        |> Codec.optionalField "name" .name stringCodec
        |> Codec.optionalField "resourceRequirements" .resourceRequirements resourceRequirementsCodec
        |> Codec.buildObject


{-| Codec for ContainerOverrides.
-}
containerOverridesCodec : Codec ContainerOverrides
containerOverridesCodec =
    Codec.list containerOverrideCodec


{-| Encoder for ContainerStateChange.
-}
containerStateChangeEncoder : ContainerStateChange -> Value
containerStateChangeEncoder val =
    [ ( "containerName", val.containerName ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
    , ( "exitCode", val.exitCode ) |> EncodeOpt.optionalField (Codec.encoder boxedIntegerCodec)
    , ( "networkBindings", val.networkBindings ) |> EncodeOpt.optionalField (Codec.encoder networkBindingsCodec)
    , ( "reason", val.reason ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
    , ( "status", val.status ) |> EncodeOpt.optionalField (Codec.encoder stringCodec)
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for ContainerStateChanges.
-}
containerStateChangesEncoder : ContainerStateChanges -> Value
containerStateChangesEncoder val =
    Json.Encode.list containerStateChangeEncoder val


{-| Decoder for Containers.
-}
containersDecoder : Decoder Containers
containersDecoder =
    Json.Decode.list containerDecoder


{-| Decoder for Deployment.
-}
deploymentDecoder : Decoder Deployment
deploymentDecoder =
    Json.Decode.succeed Deployment
        |> Pipeline.optional "createdAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "desiredCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional "id" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "launchType" (Json.Decode.maybe (Codec.decoder launchTypeCodec)) Nothing
        |> Pipeline.optional
            "networkConfiguration"
            (Json.Decode.maybe (Codec.decoder networkConfigurationCodec))
            Nothing
        |> Pipeline.optional "pendingCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional "platformVersion" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "runningCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional "status" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "taskDefinition" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "updatedAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing


{-| Codec for DeploymentConfiguration.
-}
deploymentConfigurationCodec : Codec DeploymentConfiguration
deploymentConfigurationCodec =
    Codec.object DeploymentConfiguration
        |> Codec.optionalField "maximumPercent" .maximumPercent boxedIntegerCodec
        |> Codec.optionalField "minimumHealthyPercent" .minimumHealthyPercent boxedIntegerCodec
        |> Codec.buildObject


{-| Codec for DeploymentController.
-}
deploymentControllerCodec : Codec DeploymentController
deploymentControllerCodec =
    Codec.object DeploymentController |> Codec.field "type" .type_ deploymentControllerTypeCodec |> Codec.buildObject


{-| Codec for DeploymentControllerType.
-}
deploymentControllerTypeCodec : Codec DeploymentControllerType
deploymentControllerTypeCodec =
    Codec.build (Enum.encoder deploymentControllerType) (Enum.decoder deploymentControllerType)


{-| Decoder for Deployments.
-}
deploymentsDecoder : Decoder Deployments
deploymentsDecoder =
    Json.Decode.list deploymentDecoder


{-| Encoder for DesiredStatus.
-}
desiredStatusEncoder : DesiredStatus -> Value
desiredStatusEncoder =
    Enum.encoder desiredStatus


{-| Codec for Device.
-}
deviceCodec : Codec Device
deviceCodec =
    Codec.object Device
        |> Codec.optionalField "containerPath" .containerPath stringCodec
        |> Codec.field "hostPath" .hostPath stringCodec
        |> Codec.optionalField "permissions" .permissions deviceCgroupPermissionsCodec
        |> Codec.buildObject


{-| Codec for DeviceCgroupPermission.
-}
deviceCgroupPermissionCodec : Codec DeviceCgroupPermission
deviceCgroupPermissionCodec =
    Codec.build (Enum.encoder deviceCgroupPermission) (Enum.decoder deviceCgroupPermission)


{-| Codec for DeviceCgroupPermissions.
-}
deviceCgroupPermissionsCodec : Codec DeviceCgroupPermissions
deviceCgroupPermissionsCodec =
    Codec.list deviceCgroupPermissionCodec


{-| Codec for DevicesList.
-}
devicesListCodec : Codec DevicesList
devicesListCodec =
    Codec.list deviceCodec


{-| Codec for DockerLabelsMap.
-}
dockerLabelsMapCodec : Codec DockerLabelsMap
dockerLabelsMapCodec =
    Codec.dict stringCodec


{-| Codec for DockerVolumeConfiguration.
-}
dockerVolumeConfigurationCodec : Codec DockerVolumeConfiguration
dockerVolumeConfigurationCodec =
    Codec.object DockerVolumeConfiguration
        |> Codec.optionalField "autoprovision" .autoprovision boxedBooleanCodec
        |> Codec.optionalField "driver" .driver stringCodec
        |> Codec.optionalField "driverOpts" .driverOpts stringMapCodec
        |> Codec.optionalField "labels" .labels stringMapCodec
        |> Codec.optionalField "scope" .scope scopeCodec
        |> Codec.buildObject


{-| Codec for Double.
-}
doubleCodec : Codec Double
doubleCodec =
    Codec.float


{-| Codec for EnvironmentVariables.
-}
environmentVariablesCodec : Codec EnvironmentVariables
environmentVariablesCodec =
    Codec.list keyValuePairCodec


{-| Decoder for Failure.
-}
failureDecoder : Decoder Failure
failureDecoder =
    Json.Decode.succeed Failure
        |> Pipeline.optional "arn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "reason" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing


{-| Decoder for Failures.
-}
failuresDecoder : Decoder Failures
failuresDecoder =
    Json.Decode.list failureDecoder


{-| Decoder for GpuIds.
-}
gpuIdsDecoder : Decoder GpuIds
gpuIdsDecoder =
    Json.Decode.list (Codec.decoder stringCodec)


{-| Codec for HealthCheck.
-}
healthCheckCodec : Codec HealthCheck
healthCheckCodec =
    Codec.object HealthCheck
        |> Codec.field "command" .command stringListCodec
        |> Codec.optionalField "interval" .interval boxedIntegerCodec
        |> Codec.optionalField "retries" .retries boxedIntegerCodec
        |> Codec.optionalField "startPeriod" .startPeriod boxedIntegerCodec
        |> Codec.optionalField "timeout" .timeout boxedIntegerCodec
        |> Codec.buildObject


{-| Decoder for HealthStatus.
-}
healthStatusDecoder : Decoder HealthStatus
healthStatusDecoder =
    Enum.decoder healthStatus


{-| Codec for HostEntry.
-}
hostEntryCodec : Codec HostEntry
hostEntryCodec =
    Codec.object HostEntry
        |> Codec.field "hostname" .hostname stringCodec
        |> Codec.field "ipAddress" .ipAddress stringCodec
        |> Codec.buildObject


{-| Codec for HostEntryList.
-}
hostEntryListCodec : Codec HostEntryList
hostEntryListCodec =
    Codec.list hostEntryCodec


{-| Codec for HostVolumeProperties.
-}
hostVolumePropertiesCodec : Codec HostVolumeProperties
hostVolumePropertiesCodec =
    Codec.object HostVolumeProperties |> Codec.optionalField "sourcePath" .sourcePath stringCodec |> Codec.buildObject


{-| Codec for Integer.
-}
integerCodec : Codec Integer
integerCodec =
    Codec.int


{-| Codec for IpcMode.
-}
ipcModeCodec : Codec IpcMode
ipcModeCodec =
    Codec.build (Enum.encoder ipcMode) (Enum.decoder ipcMode)


{-| Codec for KernelCapabilities.
-}
kernelCapabilitiesCodec : Codec KernelCapabilities
kernelCapabilitiesCodec =
    Codec.object KernelCapabilities
        |> Codec.optionalField "add" .add stringListCodec
        |> Codec.optionalField "drop" .drop stringListCodec
        |> Codec.buildObject


{-| Codec for KeyValuePair.
-}
keyValuePairCodec : Codec KeyValuePair
keyValuePairCodec =
    Codec.object KeyValuePair
        |> Codec.optionalField "name" .name stringCodec
        |> Codec.optionalField "value" .value stringCodec
        |> Codec.buildObject


{-| Codec for LaunchType.
-}
launchTypeCodec : Codec LaunchType
launchTypeCodec =
    Codec.build (Enum.encoder launchType) (Enum.decoder launchType)


{-| Codec for LinuxParameters.
-}
linuxParametersCodec : Codec LinuxParameters
linuxParametersCodec =
    Codec.object LinuxParameters
        |> Codec.optionalField "capabilities" .capabilities kernelCapabilitiesCodec
        |> Codec.optionalField "devices" .devices devicesListCodec
        |> Codec.optionalField "initProcessEnabled" .initProcessEnabled boxedBooleanCodec
        |> Codec.optionalField "sharedMemorySize" .sharedMemorySize boxedIntegerCodec
        |> Codec.optionalField "tmpfs" .tmpfs tmpfsListCodec
        |> Codec.buildObject


{-| Codec for LoadBalancer.
-}
loadBalancerCodec : Codec LoadBalancer
loadBalancerCodec =
    Codec.object LoadBalancer
        |> Codec.optionalField "containerName" .containerName stringCodec
        |> Codec.optionalField "containerPort" .containerPort boxedIntegerCodec
        |> Codec.optionalField "loadBalancerName" .loadBalancerName stringCodec
        |> Codec.optionalField "targetGroupArn" .targetGroupArn stringCodec
        |> Codec.buildObject


{-| Codec for LoadBalancers.
-}
loadBalancersCodec : Codec LoadBalancers
loadBalancersCodec =
    Codec.list loadBalancerCodec


{-| Codec for LogConfiguration.
-}
logConfigurationCodec : Codec LogConfiguration
logConfigurationCodec =
    Codec.object LogConfiguration
        |> Codec.field "logDriver" .logDriver logDriverCodec
        |> Codec.optionalField "options" .options logConfigurationOptionsMapCodec
        |> Codec.optionalField "secretOptions" .secretOptions secretListCodec
        |> Codec.buildObject


{-| Codec for LogConfigurationOptionsMap.
-}
logConfigurationOptionsMapCodec : Codec LogConfigurationOptionsMap
logConfigurationOptionsMapCodec =
    Codec.dict stringCodec


{-| Codec for LogDriver.
-}
logDriverCodec : Codec LogDriver
logDriverCodec =
    Codec.build (Enum.encoder logDriver) (Enum.decoder logDriver)


{-| Codec for Long.
-}
longCodec : Codec Long
longCodec =
    Codec.int


{-| Codec for MountPoint.
-}
mountPointCodec : Codec MountPoint
mountPointCodec =
    Codec.object MountPoint
        |> Codec.optionalField "containerPath" .containerPath stringCodec
        |> Codec.optionalField "readOnly" .readOnly boxedBooleanCodec
        |> Codec.optionalField "sourceVolume" .sourceVolume stringCodec
        |> Codec.buildObject


{-| Codec for MountPointList.
-}
mountPointListCodec : Codec MountPointList
mountPointListCodec =
    Codec.list mountPointCodec


{-| Codec for NetworkBinding.
-}
networkBindingCodec : Codec NetworkBinding
networkBindingCodec =
    Codec.object NetworkBinding
        |> Codec.optionalField "bindIP" .bindIp stringCodec
        |> Codec.optionalField "containerPort" .containerPort boxedIntegerCodec
        |> Codec.optionalField "hostPort" .hostPort boxedIntegerCodec
        |> Codec.optionalField "protocol" .protocol transportProtocolCodec
        |> Codec.buildObject


{-| Codec for NetworkBindings.
-}
networkBindingsCodec : Codec NetworkBindings
networkBindingsCodec =
    Codec.list networkBindingCodec


{-| Codec for NetworkConfiguration.
-}
networkConfigurationCodec : Codec NetworkConfiguration
networkConfigurationCodec =
    Codec.object NetworkConfiguration
        |> Codec.optionalField "awsvpcConfiguration" .awsvpcConfiguration awsVpcConfigurationCodec
        |> Codec.buildObject


{-| Decoder for NetworkInterface.
-}
networkInterfaceDecoder : Decoder NetworkInterface
networkInterfaceDecoder =
    Json.Decode.succeed NetworkInterface
        |> Pipeline.optional "attachmentId" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "ipv6Address" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "privateIpv4Address" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing


{-| Decoder for NetworkInterfaces.
-}
networkInterfacesDecoder : Decoder NetworkInterfaces
networkInterfacesDecoder =
    Json.Decode.list networkInterfaceDecoder


{-| Codec for NetworkMode.
-}
networkModeCodec : Codec NetworkMode
networkModeCodec =
    Codec.build (Enum.encoder networkMode) (Enum.decoder networkMode)


{-| Codec for PidMode.
-}
pidModeCodec : Codec PidMode
pidModeCodec =
    Codec.build (Enum.encoder pidMode) (Enum.decoder pidMode)


{-| Codec for PlacementConstraint.
-}
placementConstraintCodec : Codec PlacementConstraint
placementConstraintCodec =
    Codec.object PlacementConstraint
        |> Codec.optionalField "expression" .expression stringCodec
        |> Codec.optionalField "type" .type_ placementConstraintTypeCodec
        |> Codec.buildObject


{-| Codec for PlacementConstraintType.
-}
placementConstraintTypeCodec : Codec PlacementConstraintType
placementConstraintTypeCodec =
    Codec.build (Enum.encoder placementConstraintType) (Enum.decoder placementConstraintType)


{-| Codec for PlacementConstraints.
-}
placementConstraintsCodec : Codec PlacementConstraints
placementConstraintsCodec =
    Codec.list placementConstraintCodec


{-| Codec for PlacementStrategies.
-}
placementStrategiesCodec : Codec PlacementStrategies
placementStrategiesCodec =
    Codec.list placementStrategyCodec


{-| Codec for PlacementStrategy.
-}
placementStrategyCodec : Codec PlacementStrategy
placementStrategyCodec =
    Codec.object PlacementStrategy
        |> Codec.optionalField "field" .field stringCodec
        |> Codec.optionalField "type" .type_ placementStrategyTypeCodec
        |> Codec.buildObject


{-| Codec for PlacementStrategyType.
-}
placementStrategyTypeCodec : Codec PlacementStrategyType
placementStrategyTypeCodec =
    Codec.build (Enum.encoder placementStrategyType) (Enum.decoder placementStrategyType)


{-| Encoder for PlatformDevice.
-}
platformDeviceEncoder : PlatformDevice -> Value
platformDeviceEncoder val =
    [ ( "id", val.id ) |> EncodeOpt.field (Codec.encoder stringCodec)
    , ( "type", val.type_ ) |> EncodeOpt.field platformDeviceTypeEncoder
    ]
        |> EncodeOpt.objectMaySkip


{-| Encoder for PlatformDeviceType.
-}
platformDeviceTypeEncoder : PlatformDeviceType -> Value
platformDeviceTypeEncoder =
    Enum.encoder platformDeviceType


{-| Encoder for PlatformDevices.
-}
platformDevicesEncoder : PlatformDevices -> Value
platformDevicesEncoder val =
    Json.Encode.list platformDeviceEncoder val


{-| Codec for PortMapping.
-}
portMappingCodec : Codec PortMapping
portMappingCodec =
    Codec.object PortMapping
        |> Codec.optionalField "containerPort" .containerPort boxedIntegerCodec
        |> Codec.optionalField "hostPort" .hostPort boxedIntegerCodec
        |> Codec.optionalField "protocol" .protocol transportProtocolCodec
        |> Codec.buildObject


{-| Codec for PortMappingList.
-}
portMappingListCodec : Codec PortMappingList
portMappingListCodec =
    Codec.list portMappingCodec


{-| Codec for PropagateTags.
-}
propagateTagsCodec : Codec PropagateTags
propagateTagsCodec =
    Codec.build (Enum.encoder propagateTags) (Enum.decoder propagateTags)


{-| Codec for ProxyConfiguration.
-}
proxyConfigurationCodec : Codec ProxyConfiguration
proxyConfigurationCodec =
    Codec.object ProxyConfiguration
        |> Codec.field "containerName" .containerName stringCodec
        |> Codec.optionalField "properties" .properties proxyConfigurationPropertiesCodec
        |> Codec.optionalField "type" .type_ proxyConfigurationTypeCodec
        |> Codec.buildObject


{-| Codec for ProxyConfigurationProperties.
-}
proxyConfigurationPropertiesCodec : Codec ProxyConfigurationProperties
proxyConfigurationPropertiesCodec =
    Codec.list keyValuePairCodec


{-| Codec for ProxyConfigurationType.
-}
proxyConfigurationTypeCodec : Codec ProxyConfigurationType
proxyConfigurationTypeCodec =
    Codec.build (Enum.encoder proxyConfigurationType) (Enum.decoder proxyConfigurationType)


{-| Codec for RepositoryCredentials.
-}
repositoryCredentialsCodec : Codec RepositoryCredentials
repositoryCredentialsCodec =
    Codec.object RepositoryCredentials
        |> Codec.field "credentialsParameter" .credentialsParameter stringCodec
        |> Codec.buildObject


{-| Decoder for RequiresAttributes.
-}
requiresAttributesDecoder : Decoder RequiresAttributes
requiresAttributesDecoder =
    Json.Decode.list (Codec.decoder attributeCodec)


{-| Codec for Resource.
-}
resourceCodec : Codec Resource
resourceCodec =
    Codec.object Resource
        |> Codec.optionalField "doubleValue" .doubleValue doubleCodec
        |> Codec.optionalField "integerValue" .integerValue integerCodec
        |> Codec.optionalField "longValue" .longValue longCodec
        |> Codec.optionalField "name" .name stringCodec
        |> Codec.optionalField "stringSetValue" .stringSetValue stringListCodec
        |> Codec.optionalField "type" .type_ stringCodec
        |> Codec.buildObject


{-| Codec for ResourceRequirement.
-}
resourceRequirementCodec : Codec ResourceRequirement
resourceRequirementCodec =
    Codec.object ResourceRequirement
        |> Codec.field "type" .type_ resourceTypeCodec
        |> Codec.field "value" .value stringCodec
        |> Codec.buildObject


{-| Codec for ResourceRequirements.
-}
resourceRequirementsCodec : Codec ResourceRequirements
resourceRequirementsCodec =
    Codec.list resourceRequirementCodec


{-| Codec for ResourceType.
-}
resourceTypeCodec : Codec ResourceType
resourceTypeCodec =
    Codec.build (Enum.encoder resourceType) (Enum.decoder resourceType)


{-| Codec for Resources.
-}
resourcesCodec : Codec Resources
resourcesCodec =
    Codec.list resourceCodec


{-| Codec for Scale.
-}
scaleCodec : Codec Scale
scaleCodec =
    Codec.object Scale
        |> Codec.optionalField "unit" .unit scaleUnitCodec
        |> Codec.optionalField "value" .value doubleCodec
        |> Codec.buildObject


{-| Codec for ScaleUnit.
-}
scaleUnitCodec : Codec ScaleUnit
scaleUnitCodec =
    Codec.build (Enum.encoder scaleUnit) (Enum.decoder scaleUnit)


{-| Codec for SchedulingStrategy.
-}
schedulingStrategyCodec : Codec SchedulingStrategy
schedulingStrategyCodec =
    Codec.build (Enum.encoder schedulingStrategy) (Enum.decoder schedulingStrategy)


{-| Codec for Scope.
-}
scopeCodec : Codec Scope
scopeCodec =
    Codec.build (Enum.encoder scope) (Enum.decoder scope)


{-| Codec for Secret.
-}
secretCodec : Codec Secret
secretCodec =
    Codec.object Secret
        |> Codec.field "name" .name stringCodec
        |> Codec.field "valueFrom" .valueFrom stringCodec
        |> Codec.buildObject


{-| Codec for SecretList.
-}
secretListCodec : Codec SecretList
secretListCodec =
    Codec.list secretCodec


{-| Decoder for Service.
-}
serviceDecoder : Decoder Service
serviceDecoder =
    Json.Decode.succeed Service
        |> Pipeline.optional "clusterArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "createdAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "createdBy" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional
            "deploymentConfiguration"
            (Json.Decode.maybe (Codec.decoder deploymentConfigurationCodec))
            Nothing
        |> Pipeline.optional
            "deploymentController"
            (Json.Decode.maybe (Codec.decoder deploymentControllerCodec))
            Nothing
        |> Pipeline.optional "deployments" (Json.Decode.maybe deploymentsDecoder) Nothing
        |> Pipeline.optional "desiredCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional "enableECSManagedTags" (Json.Decode.maybe (Codec.decoder booleanCodec)) Nothing
        |> Pipeline.optional "events" (Json.Decode.maybe serviceEventsDecoder) Nothing
        |> Pipeline.optional
            "healthCheckGracePeriodSeconds"
            (Json.Decode.maybe (Codec.decoder boxedIntegerCodec))
            Nothing
        |> Pipeline.optional "launchType" (Json.Decode.maybe (Codec.decoder launchTypeCodec)) Nothing
        |> Pipeline.optional "loadBalancers" (Json.Decode.maybe (Codec.decoder loadBalancersCodec)) Nothing
        |> Pipeline.optional
            "networkConfiguration"
            (Json.Decode.maybe (Codec.decoder networkConfigurationCodec))
            Nothing
        |> Pipeline.optional "pendingCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional
            "placementConstraints"
            (Json.Decode.maybe (Codec.decoder placementConstraintsCodec))
            Nothing
        |> Pipeline.optional "placementStrategy" (Json.Decode.maybe (Codec.decoder placementStrategiesCodec)) Nothing
        |> Pipeline.optional "platformVersion" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "propagateTags" (Json.Decode.maybe (Codec.decoder propagateTagsCodec)) Nothing
        |> Pipeline.optional "roleArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "runningCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional "schedulingStrategy" (Json.Decode.maybe (Codec.decoder schedulingStrategyCodec)) Nothing
        |> Pipeline.optional "serviceArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "serviceName" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "serviceRegistries" (Json.Decode.maybe (Codec.decoder serviceRegistriesCodec)) Nothing
        |> Pipeline.optional "status" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "tags" (Json.Decode.maybe (Codec.decoder tagsCodec)) Nothing
        |> Pipeline.optional "taskDefinition" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "taskSets" (Json.Decode.maybe taskSetsDecoder) Nothing


{-| Decoder for ServiceEvent.
-}
serviceEventDecoder : Decoder ServiceEvent
serviceEventDecoder =
    Json.Decode.succeed ServiceEvent
        |> Pipeline.optional "createdAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "id" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "message" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing


{-| Decoder for ServiceEvents.
-}
serviceEventsDecoder : Decoder ServiceEvents
serviceEventsDecoder =
    Json.Decode.list serviceEventDecoder


{-| Encoder for ServiceField.
-}
serviceFieldEncoder : ServiceField -> Value
serviceFieldEncoder =
    Enum.encoder serviceField


{-| Encoder for ServiceFieldList.
-}
serviceFieldListEncoder : ServiceFieldList -> Value
serviceFieldListEncoder val =
    Json.Encode.list serviceFieldEncoder val


{-| Codec for ServiceRegistries.
-}
serviceRegistriesCodec : Codec ServiceRegistries
serviceRegistriesCodec =
    Codec.list serviceRegistryCodec


{-| Codec for ServiceRegistry.
-}
serviceRegistryCodec : Codec ServiceRegistry
serviceRegistryCodec =
    Codec.object ServiceRegistry
        |> Codec.optionalField "containerName" .containerName stringCodec
        |> Codec.optionalField "containerPort" .containerPort boxedIntegerCodec
        |> Codec.optionalField "port" .port_ boxedIntegerCodec
        |> Codec.optionalField "registryArn" .registryArn stringCodec
        |> Codec.buildObject


{-| Decoder for Services.
-}
servicesDecoder : Decoder Services
servicesDecoder =
    Json.Decode.list serviceDecoder


{-| Decoder for Setting.
-}
settingDecoder : Decoder Setting
settingDecoder =
    Json.Decode.succeed Setting
        |> Pipeline.optional "name" (Json.Decode.maybe (Codec.decoder settingNameCodec)) Nothing
        |> Pipeline.optional "principalArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "value" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing


{-| Codec for SettingName.
-}
settingNameCodec : Codec SettingName
settingNameCodec =
    Codec.build (Enum.encoder settingName) (Enum.decoder settingName)


{-| Decoder for Settings.
-}
settingsDecoder : Decoder Settings
settingsDecoder =
    Json.Decode.list settingDecoder


{-| Encoder for SortOrder.
-}
sortOrderEncoder : SortOrder -> Value
sortOrderEncoder =
    Enum.encoder sortOrder


{-| Decoder for StabilityStatus.
-}
stabilityStatusDecoder : Decoder StabilityStatus
stabilityStatusDecoder =
    Enum.decoder stabilityStatus


{-| Decoder for Statistics.
-}
statisticsDecoder : Decoder Statistics
statisticsDecoder =
    Json.Decode.list (Codec.decoder keyValuePairCodec)


{-| Codec for String\_.
-}
stringCodec : Codec String_
stringCodec =
    Codec.string


{-| Codec for StringList.
-}
stringListCodec : Codec StringList
stringListCodec =
    Codec.list stringCodec


{-| Codec for StringMap.
-}
stringMapCodec : Codec StringMap
stringMapCodec =
    Codec.dict stringCodec


{-| Codec for SystemControl.
-}
systemControlCodec : Codec SystemControl
systemControlCodec =
    Codec.object SystemControl
        |> Codec.optionalField "namespace" .namespace stringCodec
        |> Codec.optionalField "value" .value stringCodec
        |> Codec.buildObject


{-| Codec for SystemControls.
-}
systemControlsCodec : Codec SystemControls
systemControlsCodec =
    Codec.list systemControlCodec


{-| Codec for Tag.
-}
tagCodec : Codec Tag
tagCodec =
    Codec.object Tag
        |> Codec.optionalField "key" .key tagKeyCodec
        |> Codec.optionalField "value" .value tagValueCodec
        |> Codec.buildObject


{-| Codec for TagKey.
-}
tagKeyCodec : Codec TagKey
tagKeyCodec =
    Codec.string


{-| Encoder for TagKeys.
-}
tagKeysEncoder : TagKeys -> Value
tagKeysEncoder val =
    Json.Encode.list (Codec.encoder tagKeyCodec) val


{-| Codec for TagValue.
-}
tagValueCodec : Codec TagValue
tagValueCodec =
    Codec.string


{-| Codec for Tags.
-}
tagsCodec : Codec Tags
tagsCodec =
    Codec.list tagCodec


{-| Codec for TargetType.
-}
targetTypeCodec : Codec TargetType
targetTypeCodec =
    Codec.build (Enum.encoder targetType) (Enum.decoder targetType)


{-| Decoder for Task.
-}
taskDecoder : Decoder Task
taskDecoder =
    Json.Decode.succeed Task
        |> Pipeline.optional "attachments" (Json.Decode.maybe attachmentsDecoder) Nothing
        |> Pipeline.optional "clusterArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "connectivity" (Json.Decode.maybe connectivityDecoder) Nothing
        |> Pipeline.optional "connectivityAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "containerInstanceArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "containers" (Json.Decode.maybe containersDecoder) Nothing
        |> Pipeline.optional "cpu" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "createdAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "desiredStatus" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "executionStoppedAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "group" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "healthStatus" (Json.Decode.maybe healthStatusDecoder) Nothing
        |> Pipeline.optional "lastStatus" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "launchType" (Json.Decode.maybe (Codec.decoder launchTypeCodec)) Nothing
        |> Pipeline.optional "memory" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "overrides" (Json.Decode.maybe (Codec.decoder taskOverrideCodec)) Nothing
        |> Pipeline.optional "platformVersion" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "pullStartedAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "pullStoppedAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "startedAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "startedBy" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "stopCode" (Json.Decode.maybe taskStopCodeDecoder) Nothing
        |> Pipeline.optional "stoppedAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "stoppedReason" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "stoppingAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "tags" (Json.Decode.maybe (Codec.decoder tagsCodec)) Nothing
        |> Pipeline.optional "taskArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "taskDefinitionArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "version" (Json.Decode.maybe (Codec.decoder longCodec)) Nothing


{-| Decoder for TaskDefinition.
-}
taskDefinitionDecoder : Decoder TaskDefinition
taskDefinitionDecoder =
    Json.Decode.succeed TaskDefinition
        |> Pipeline.optional "compatibilities" (Json.Decode.maybe (Codec.decoder compatibilityListCodec)) Nothing
        |> Pipeline.optional
            "containerDefinitions"
            (Json.Decode.maybe (Codec.decoder containerDefinitionsCodec))
            Nothing
        |> Pipeline.optional "cpu" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "executionRoleArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "family" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "ipcMode" (Json.Decode.maybe (Codec.decoder ipcModeCodec)) Nothing
        |> Pipeline.optional "memory" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "networkMode" (Json.Decode.maybe (Codec.decoder networkModeCodec)) Nothing
        |> Pipeline.optional "pidMode" (Json.Decode.maybe (Codec.decoder pidModeCodec)) Nothing
        |> Pipeline.optional
            "placementConstraints"
            (Json.Decode.maybe (Codec.decoder taskDefinitionPlacementConstraintsCodec))
            Nothing
        |> Pipeline.optional "proxyConfiguration" (Json.Decode.maybe (Codec.decoder proxyConfigurationCodec)) Nothing
        |> Pipeline.optional "requiresAttributes" (Json.Decode.maybe requiresAttributesDecoder) Nothing
        |> Pipeline.optional
            "requiresCompatibilities"
            (Json.Decode.maybe (Codec.decoder compatibilityListCodec))
            Nothing
        |> Pipeline.optional "revision" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional "status" (Json.Decode.maybe (Codec.decoder taskDefinitionStatusCodec)) Nothing
        |> Pipeline.optional "taskDefinitionArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "taskRoleArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "volumes" (Json.Decode.maybe (Codec.decoder volumeListCodec)) Nothing


{-| Encoder for TaskDefinitionFamilyStatus.
-}
taskDefinitionFamilyStatusEncoder : TaskDefinitionFamilyStatus -> Value
taskDefinitionFamilyStatusEncoder =
    Enum.encoder taskDefinitionFamilyStatus


{-| Encoder for TaskDefinitionField.
-}
taskDefinitionFieldEncoder : TaskDefinitionField -> Value
taskDefinitionFieldEncoder =
    Enum.encoder taskDefinitionField


{-| Encoder for TaskDefinitionFieldList.
-}
taskDefinitionFieldListEncoder : TaskDefinitionFieldList -> Value
taskDefinitionFieldListEncoder val =
    Json.Encode.list taskDefinitionFieldEncoder val


{-| Codec for TaskDefinitionPlacementConstraint.
-}
taskDefinitionPlacementConstraintCodec : Codec TaskDefinitionPlacementConstraint
taskDefinitionPlacementConstraintCodec =
    Codec.object TaskDefinitionPlacementConstraint
        |> Codec.optionalField "expression" .expression stringCodec
        |> Codec.optionalField "type" .type_ taskDefinitionPlacementConstraintTypeCodec
        |> Codec.buildObject


{-| Codec for TaskDefinitionPlacementConstraintType.
-}
taskDefinitionPlacementConstraintTypeCodec : Codec TaskDefinitionPlacementConstraintType
taskDefinitionPlacementConstraintTypeCodec =
    Codec.build
        (Enum.encoder taskDefinitionPlacementConstraintType)
        (Enum.decoder taskDefinitionPlacementConstraintType)


{-| Codec for TaskDefinitionPlacementConstraints.
-}
taskDefinitionPlacementConstraintsCodec : Codec TaskDefinitionPlacementConstraints
taskDefinitionPlacementConstraintsCodec =
    Codec.list taskDefinitionPlacementConstraintCodec


{-| Codec for TaskDefinitionStatus.
-}
taskDefinitionStatusCodec : Codec TaskDefinitionStatus
taskDefinitionStatusCodec =
    Codec.build (Enum.encoder taskDefinitionStatus) (Enum.decoder taskDefinitionStatus)


{-| Encoder for TaskField.
-}
taskFieldEncoder : TaskField -> Value
taskFieldEncoder =
    Enum.encoder taskField


{-| Encoder for TaskFieldList.
-}
taskFieldListEncoder : TaskFieldList -> Value
taskFieldListEncoder val =
    Json.Encode.list taskFieldEncoder val


{-| Codec for TaskOverride.
-}
taskOverrideCodec : Codec TaskOverride
taskOverrideCodec =
    Codec.object TaskOverride
        |> Codec.optionalField "containerOverrides" .containerOverrides containerOverridesCodec
        |> Codec.optionalField "executionRoleArn" .executionRoleArn stringCodec
        |> Codec.optionalField "taskRoleArn" .taskRoleArn stringCodec
        |> Codec.buildObject


{-| Decoder for TaskSet.
-}
taskSetDecoder : Decoder TaskSet
taskSetDecoder =
    Json.Decode.succeed TaskSet
        |> Pipeline.optional "clusterArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "computedDesiredCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional "createdAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "externalId" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "id" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "launchType" (Json.Decode.maybe (Codec.decoder launchTypeCodec)) Nothing
        |> Pipeline.optional "loadBalancers" (Json.Decode.maybe (Codec.decoder loadBalancersCodec)) Nothing
        |> Pipeline.optional
            "networkConfiguration"
            (Json.Decode.maybe (Codec.decoder networkConfigurationCodec))
            Nothing
        |> Pipeline.optional "pendingCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional "platformVersion" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "runningCount" (Json.Decode.maybe (Codec.decoder integerCodec)) Nothing
        |> Pipeline.optional "scale" (Json.Decode.maybe (Codec.decoder scaleCodec)) Nothing
        |> Pipeline.optional "serviceArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "serviceRegistries" (Json.Decode.maybe (Codec.decoder serviceRegistriesCodec)) Nothing
        |> Pipeline.optional "stabilityStatus" (Json.Decode.maybe stabilityStatusDecoder) Nothing
        |> Pipeline.optional "stabilityStatusAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing
        |> Pipeline.optional "startedBy" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "status" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "taskDefinition" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "taskSetArn" (Json.Decode.maybe (Codec.decoder stringCodec)) Nothing
        |> Pipeline.optional "updatedAt" (Json.Decode.maybe (Codec.decoder timestampCodec)) Nothing


{-| Decoder for TaskSets.
-}
taskSetsDecoder : Decoder TaskSets
taskSetsDecoder =
    Json.Decode.list taskSetDecoder


{-| Decoder for TaskStopCode.
-}
taskStopCodeDecoder : Decoder TaskStopCode
taskStopCodeDecoder =
    Enum.decoder taskStopCode


{-| Decoder for Tasks.
-}
tasksDecoder : Decoder Tasks
tasksDecoder =
    Json.Decode.list taskDecoder


{-| Codec for Timestamp.
-}
timestampCodec : Codec Timestamp
timestampCodec =
    Codec.string


{-| Codec for Tmpfs.
-}
tmpfsCodec : Codec Tmpfs
tmpfsCodec =
    Codec.object Tmpfs
        |> Codec.field "containerPath" .containerPath stringCodec
        |> Codec.optionalField "mountOptions" .mountOptions stringListCodec
        |> Codec.field "size" .size integerCodec
        |> Codec.buildObject


{-| Codec for TmpfsList.
-}
tmpfsListCodec : Codec TmpfsList
tmpfsListCodec =
    Codec.list tmpfsCodec


{-| Codec for TransportProtocol.
-}
transportProtocolCodec : Codec TransportProtocol
transportProtocolCodec =
    Codec.build (Enum.encoder transportProtocol) (Enum.decoder transportProtocol)


{-| Codec for Ulimit.
-}
ulimitCodec : Codec Ulimit
ulimitCodec =
    Codec.object Ulimit
        |> Codec.field "hardLimit" .hardLimit integerCodec
        |> Codec.field "name" .name ulimitNameCodec
        |> Codec.field "softLimit" .softLimit integerCodec
        |> Codec.buildObject


{-| Codec for UlimitList.
-}
ulimitListCodec : Codec UlimitList
ulimitListCodec =
    Codec.list ulimitCodec


{-| Codec for UlimitName.
-}
ulimitNameCodec : Codec UlimitName
ulimitNameCodec =
    Codec.build (Enum.encoder ulimitName) (Enum.decoder ulimitName)


{-| Codec for VersionInfo.
-}
versionInfoCodec : Codec VersionInfo
versionInfoCodec =
    Codec.object VersionInfo
        |> Codec.optionalField "agentHash" .agentHash stringCodec
        |> Codec.optionalField "agentVersion" .agentVersion stringCodec
        |> Codec.optionalField "dockerVersion" .dockerVersion stringCodec
        |> Codec.buildObject


{-| Codec for Volume.
-}
volumeCodec : Codec Volume
volumeCodec =
    Codec.object Volume
        |> Codec.optionalField "dockerVolumeConfiguration" .dockerVolumeConfiguration dockerVolumeConfigurationCodec
        |> Codec.optionalField "host" .host hostVolumePropertiesCodec
        |> Codec.optionalField "name" .name stringCodec
        |> Codec.buildObject


{-| Codec for VolumeFrom.
-}
volumeFromCodec : Codec VolumeFrom
volumeFromCodec =
    Codec.object VolumeFrom
        |> Codec.optionalField "readOnly" .readOnly boxedBooleanCodec
        |> Codec.optionalField "sourceContainer" .sourceContainer stringCodec
        |> Codec.buildObject


{-| Codec for VolumeFromList.
-}
volumeFromListCodec : Codec VolumeFromList
volumeFromListCodec =
    Codec.list volumeFromCodec


{-| Codec for VolumeList.
-}
volumeListCodec : Codec VolumeList
volumeListCodec =
    Codec.list volumeCodec
