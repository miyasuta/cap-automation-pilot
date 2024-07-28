/* checksum : d29b043b55fb44e881b2de97770ce3ba */
@Capabilities.BatchSupported : false
@Capabilities.KeyAsSegmentSupported : true
@Core.Description : 'Executions'
@Core.SchemaVersion : '1'
@Core.LongDescription : 'Enables you to manage executions by triggering new ones, querying their data or requesting different actions on them. You can configure triggers to react on events from sources like Alert Notification, Dynatrace, Pingdom and more.'
service Executions {};

@Common.Label : 'Executions'
@Core.Description : 'Retrieves executions'
@Core.LongDescription : 'Retrieves all executions owned by the tenant.<br/><br/>Required permissions: Read'
@openapi.path : '/executions'
function Executions.executions(
  @description : 'Optional key-value pairs used to filter executions.'
  @openapi.in : 'query'
  tag : many String
) returns many Executions_types.execution;

@Common.Label : 'Executions'
@Core.Description : 'Triggers an execution'
@Core.LongDescription : 'Triggers a new execution from the specified command.<br/><br/>Required permissions: Execute'
@openapi.path : '/executions'
action Executions.executions_post(
  @openapi.in : 'body'
  body : Executions_types.executionRequest
) returns Executions_types.execution;

@Common.Label : 'Executions'
@Core.Description : 'Retrieves an execution'
@Core.LongDescription : 'Retrieves detailed information about a single execution.<br/><br/>Required permissions: Read'
@openapi.path : '/executions/{executionId}'
function Executions.executions_(
  @description : 'Identifier of an execution.'
  @openapi.in : 'path'
  executionId : String(256)
) returns Executions_types.detailedExecution;

@Common.Label : 'Executions'
@Core.Description : 'Delete a completed execution'
@Core.LongDescription : 'Delete a single completed execution.<br/><br/>Required permissions: Write'
@openapi.method : 'DELETE'
@openapi.path : '/executions/{executionId}'
action Executions.executions__delete(
  @description : 'Identifier of an execution.'
  @openapi.in : 'path'
  executionId : String(256)
);

@Common.Label : 'Executions'
@Core.Description : 'Retrieves input of an execution'
@Core.LongDescription : 'Retrieves the input of a single execution. Only values of non-sensitive input keys will be part of the response.<br/><br/>Required permissions: Read'
@openapi.path : '/executions/{executionId}/input'
function Executions.executions__input(
  @description : 'Identifier of an execution.'
  @openapi.in : 'path'
  executionId : String(256)
) returns Executions_types.executionInput;

@Common.Label : 'Executions'
@Core.Description : 'Retrieves output of an execution'
@Core.LongDescription : 'Retrieves the output of a single execution with `FINISHED` status. Only values of non-sensitive output keys will be part of the response.<br/><br/>Required permissions: Read'
@openapi.path : '/executions/{executionId}/output'
function Executions.executions__output(
  @description : 'Identifier of an execution.'
  @openapi.in : 'path'
  executionId : String(256)
) returns Executions_types.executionOutput;

@Common.Label : 'Actions'
@Core.Description : 'Retrieves actions requested for an execution'
@Core.LongDescription : 'Retrieves all actions requested for a single execution.<br/><br/>Required permissions: Read'
@openapi.path : '/executions/{executionId}/actions'
function Executions.executions__actions(
  @description : 'Identifier of an execution.'
  @openapi.in : 'path'
  executionId : String(256)
) returns many Executions_types.action;

@Common.Label : 'Actions'
@Core.Description : 'Requests action for an execution'
@Core.LongDescription : 'Requests a new action for a single execution.<br/><br/>Required permissions: Execute'
@openapi.path : '/executions/{executionId}/actions'
action Executions.executions__actions_post(
  @description : 'Identifier of an execution.'
  @openapi.in : 'path'
  executionId : String(256),
  @openapi.in : 'body'
  body : Executions_types.action
) returns Executions_types.action;

@Common.Label : 'Event Triggers'
@Core.Description : 'Triggers an execution based on an Alert Notification event'
@Core.LongDescription : 'Triggers a new execution from the specified command based on Alert Notification event.<br/><br/>Required permissions: Execute'
@openapi.path : '/triggers/ans-event'
action Executions.triggers_ans_event_post(
  @description : 'Identifier of a command to execute.'
  @openapi.in : 'query'
  @openapi.required : true
  commandReference : String(256),
  @description : 'Identifiers of inputs to be used for values.'
  @openapi.in : 'query'
  inputReference : many String(256),
  @description : 'Identifier that enables references to other actions and executions.'
  @openapi.in : 'query'
  correlationId : String(256),
  @description : 'Identifies the subaccount of the affected resource. If not specified, it will be derived from the event.'
  @openapi.in : 'query'
  subAccount : String(256),
  @description : 'Identifies an additional resource isolation level. If not specified, it will be derived from the event.'
  @openapi.in : 'query'
  resourceGroup : String(256),
  @description : 'Name of the affected resource. If not specified, it will be derived from the event.'
  @openapi.in : 'query'
  resourceName : String(256),
  @description : 'If the resource has multiple instances, this identifies the specific instance. If not specified, it will be derived from the event.'
  @openapi.in : 'query'
  resourceInstance : String(256),
  @description : 'Specifies whether the resource properties `globalAccount`, `subAccount`, `resourceGroup`, `resourceName`, `resourceType` and `resourceInstance` should be derived from the event.'
  @openapi.in : 'query'
  disableResourcePropertiesMapping : Boolean,
  @description : 'Specifies whether the properties `region` and `regionType` should be derived from the event.'
  @openapi.in : 'query'
  disableRegionPropertiesMapping : Boolean,
  @description : 'Specifies the input key to which the value of the event should be forwarded.'
  @openapi.in : 'query'
  mapEventToInputKey : String(32),
  @description : 'Optional key-value pairs providing additional information. Please use `tag` as this query parameter is deprecated.'
  @openapi.in : 'query'
  tags : many String,
  @description : 'Optional key-value pairs providing additional information.'
  @openapi.in : 'query'
  tag : many String,
  @openapi.in : 'body'
  body : Executions_types.event
) returns Executions_types.execution;

@Common.Label : 'Event Triggers'
@Core.Description : 'Triggers an execution based on any event'
@Core.LongDescription : 'Triggers a new execution from the specified command based on any event.<br/><br/>Required permissions: Execute'
@openapi.path : '/triggers/generic-event'
action Executions.triggers_generic_event_post(
  @description : 'Identifier of a command to execute.'
  @openapi.in : 'query'
  @openapi.required : true
  commandReference : String(256),
  @description : 'Identifiers of inputs to be used for values.'
  @openapi.in : 'query'
  inputReference : many String(256),
  @description : 'Identifier that enables references to other actions and executions.'
  @openapi.in : 'query'
  correlationId : String(256),
  @description : 'Specifies the input key to which the value of the event should be forwarded.'
  @openapi.in : 'query'
  mapEventToInputKey : String(32),
  @description : 'Optional key-value pairs providing additional information. Please use `tag` as this query parameter is deprecated.'
  @openapi.in : 'query'
  tags : many String,
  @description : 'Optional key-value pairs providing additional information.'
  @openapi.in : 'query'
  tag : many String,
  @openapi.in : 'body'
  body : String
) returns Executions_types.execution;

@Common.Label : 'Execution Logs'
@Core.Description : 'Retrieves an execution log'
@Core.LongDescription : 'Retrieves the execution log for a single executor. <br/><br/>Required permissions: Read'
@openapi.path : '/executions/{id}/logs/{executorPath}'
function Executions.executions__logs_(
  @description : 'Identifier of an execution.'
  @openapi.in : 'path'
  id : String(256),
  @description : 'Path to an executor.'
  @openapi.in : 'path'
  executorPath : String(1024)
) returns Executions_types.executionLog;

@Common.Label : 'Execution Logs'
@Core.Description : 'Retrieves execution logs page'
@Core.LongDescription : 'Retrieves executions logs page. <br/><br/>Required permissions: Read'
@openapi.path : '/executions/{id}/logs'
function Executions.executions__logs(
  @description : 'Identifier of an execution.'
  @openapi.in : 'path'
  id : String(256),
  @description : 'Required page number.'
  @openapi.in : 'query'
  page : Integer,
  @description : 'Maximum number of results returned for the page.'
  @openapi.in : 'query'
  maxPageSize : Integer
) returns Executions_types.executionLogsPage;

@title : 'ExecutionRequest'
@description : 'Entity which describes how an execution should be triggered.'
type Executions_types.executionRequest {
  @description : 'Identifier of a command which will be used to trigger the execution.'
  commandId : String(256);
  @description : 'Identifier which allows reference to other executions and actions.'
  correlationId : String(256);
  @description : 'Identifiers of inputs to be used for values.'
  inputReferences : many String(256);
  @description : 'Values which will be used as an input to the execution.'
  inputValues : { };
  @description : 'Optional key-value pairs providing additional information.'
  tags : { };
};

@title : 'Execution'
@description : 'Entity which represents an execution.'
type Executions_types.execution {
  @description : 'Identifier of the execution.'
  id : String;
  @description : 'Identifier of the command which was used to trigger the execution.'
  commandId : String;
  @description : 'Identifier of the initiator of the execution.'
  originatorId : String;
  @description : 'Identifier of the tenant from which the execution was triggered.'
  tenantId : String;
  @description : 'Identifier which allows reference to other executions and actions.'
  correlationId : String;
  @description : 'Optional key-value pairs providing additional information.'
  tags : { };
  @description : 'Time at which the execution was started. Format is in milliseconds since Unix epoch.'
  startTime : Integer64;
  @description : 'Time at which the execution was last modified. Format is in milliseconds since Unix epoch.'
  modificationTime : Integer64;
  status : Executions_types.executionStatus;
  @description : 'Number which shows the current execution progress. Value is between 1 and 100.'
  progress : Integer;
  @description : 'Message which provides more information about the current execution progress'
  progressMessage : String;
  @description : 'Memory in bytes that is being used by the execution. If the execution exceeds 2883584 bytes (2.75 MiB) in usage it will be suspended.'
  size : Integer64;
  @description : 'Number of API calls that were made by the execution.'
  usedQuota : Integer64;
};

@title : 'DetailedExecution'
@description : 'Entity which contains detailed information about an execution.'
type Executions_types.detailedExecution {
  @description : 'Identifier of the execution.'
  id : String;
  @description : 'Identifier of the command which was used to trigger the execution.'
  commandId : String;
  @description : 'Identifier of the requester of the execution.'
  originatorId : String;
  @description : 'Identifier of the tenant from which the execution was triggered.'
  tenantId : String;
  @description : 'Identifier that allows reference to other executions and actions.'
  correlationId : String;
  @description : 'Optional key-value pairs providing additional information.'
  tags : { };
  @description : 'Time at which the execution was started. Format is in milliseconds since Unix epoch.'
  startTime : Integer64;
  @description : 'Time at which the execution was last modified. Format is in milliseconds since Unix epoch.'
  modificationTime : Integer64;
  status : Executions_types.executionStatus;
  @description : 'Number which shows the current execution progress. Value is between 1 and 100.'
  progress : Integer;
  @description : 'Message which provides more information about the current execution progress'
  progressMessage : String;
  @description : 'Memory in bytes that is being used by the execution. If the execution exceeds 2883584 bytes (2.75 MiB) in usage it will be suspended.'
  size : Integer64;
  @description : 'Number of API calls that were made by the execution.'
  usedQuota : Integer64;
  @description : 'Message which provides more information about an execution with `FAILED` status.'
  error : String;
  @description : 'Possible values which can be selected for an execution with `INPUT_REQUIRED` status.'
  userChoice : Executions_types.userChoice;
  @description : 'Collection of all executors which are part of the execution.'
  executors : many Executions_types.executorOverview;
  @description : 'Path of the executor to which the execution has progressed.'
  currentExecutorPath : String;
};

@title : 'ExecutionInput'
@description : 'Values of the non-sensitive input keys which were used to trigger the execution.'
type Executions_types.executionInput {
  values : { };
};

@title : 'ExecutionOutput'
@description : 'Values of the non-sensitive output keys which were produced by the execution. Applicable only for executions with `FINISHED` status.'
type Executions_types.executionOutput {
  values : { };
};

@title : 'Action'
@description : 'Entity which can be used to control active executions.'
type Executions_types.action {
  @description : 'Identifier of the action.'
  id : String;
  @description : 'Type of the action.'
  type : Executions_types.actionType;
  @description : 'Value that is passed along with the action. It is required only for actions of type `RESET` and `CHOOSE`.'
  value : String;
  @description : 'Reason for requesting the action.'
  reason : String(256);
  @description : 'Identifier that enables references to other actions and executions.'
  correlationId : String(256);
  @description : 'Identifier of the requester of the action.'
  originatorId : String;
  @description : 'Time when the action was requested.'
  createdAt : Integer64;
  @description : 'Path to the executor on which the action was requested.'
  executorPath : String;
};

@title : 'ExecutionLog'
@description : 'Entity which contains log messages of all operations that were performed by an executor.'
type Executions_types.executionLog {
  condition : Executions_types.executionLogMessage;
  pause : Executions_types.executionLogMessage;
  delay : Executions_types.executionLogMessage;
  validation : Executions_types.executionLogMessage;
  retry : Executions_types.executionLogMessage;
  repetition : Executions_types.executionLogMessage;
  command : Executions_types.executionLogMessage;
  statusListener : Executions_types.executionLogMessage;
  lock : Executions_types.executionLogMessage;
  progressMessage : Executions_types.executionLogMessage;
};

@title : 'ExecutionLogsPage'
@description : 'Entity which contains information about log messages for multiple executors.'
type Executions_types.executionLogsPage {
  @description : 'Number of results in the page.'
  pageSize : Integer;
  @description : 'Page number.'
  page : Integer;
  @description : 'Links to the executors'' logs messages'
  resources : many Executions_types.executorLog;
};

@title : 'Event'
type Executions_types.event {
  @description : 'Event identifier assigned by the Alert Notification service in the moment of receiving the event.'
  id : String;
  @description : 'Identifies the alert cause in the context of an affected resource.'
  eventType : String;
  @description : 'The timestamp that specifies when the event was created in the source. Format is in seconds since Unix epoch.'
  eventTimestamp : Integer64;
  @description : 'Represents the impact in the context of an affected resource.'
  @assert.range : true
  severity : String enum {
    INFO;
    WARNING;
    ERROR;
    FATAL;
  };
  @description : 'A property that identifies the category of the event.'
  @assert.range : true
  category : String enum {
    EXCEPTION;
    ALERT;
    NOTIFICATION;
  };
  @description : 'Meaningful title of the alert with sufficient details.'
  subject : String;
  @description : 'Meaningful description of the alert with sufficient details.'
  body : String;
  @description : 'A property that defines the event urgency.'
  priority : Integer;
  @description : 'Optional key-value pairs describing the event in details.'
  tags : { };
  @description : 'Identifies the region or datacenter of the resource.'
  region : String;
  @description : 'Identifies the region or datacenter type of the resource.'
  regionType : String;
  resource : Executions_types.resourceData;
};

@title : 'Error'
@description : 'Entity which provides more information for an occurred error.'
type Executions_types.error {
  @description : 'HTTP status code.'
  code : Integer;
  @description : 'Message that describes the error in more details.'
  message : String;
};

@title : 'UserChoice'
@description : 'Entity which describes the user choice if the execution is in state `INPUT_REQUIRED`.'
type Executions_types.userChoice {
  @description : 'Title of the user choice'
  title : String(64);
  @description : 'Available options that can be selected.'
  options : { };
};

@title : 'ExecutionOverview'
@description : 'Entity which describes an execution executor.'
type Executions_types.executorOverview {
  @description : 'Non-unique value which identifies the executor.'
  alias : String;
  @description : 'Identifier of the command managed by the executor.'
  commandId : String;
  @description : 'Collection of indices which point to the child executors which are part of this executor.'
  subExecutors : many Integer;
};

@title : 'ExecutionStatus'
@description : 'Entity which describes the existing execution statuses.'
@assert.range : true
type Executions_types.executionStatus : String enum {
  RUNNING;
  FINISHED;
  FAILED;
  ABORTED;
  PAUSED;
  SUSPENDED;
  INPUT_REQUIRED;
};

@title : 'ExecutorLog'
@description : 'Information about log messages for a single executor'
type Executions_types.executorLog {
  @description : 'Path to the executor.'
  executorPath : String;
  @description : 'Reference for the executor logs.'
  link : Executions_types.executorLogRef;
};

@title : 'ExecutorLogRef'
@description : 'Reference for the executor logs of a single executor.'
type Executions_types.executorLogRef {
  @description : 'Hyperlink for the executor logs of the executor.'
  href : String;
  @description : 'Type of the reference.'
  rel : String;
};

@title : 'ActionType'
@description : 'Action types that can be requested on executions. The RESET_AND_RETRY action is DEPRECATED in favor of the RESET action.'
@assert.range : true
type Executions_types.actionType : String enum {
  PAUSE;
  RESUME;
  ABORT;
  RETRY;
  SUSPEND;
  RESET_AND_RETRY;
  RESET;
  CHOOSE;
  EXECUTE_STATUS_LISTENER;
  FAIL;
};

@title : 'ExecutionLogMessage'
@description : 'The log message for a single operation performed by an executor (e.g. a repetition).'
type Executions_types.executionLogMessage {
  @description : 'Traceability information for an executor operation such as condition, validation, repetition, etc'
  message : String;
  @description : 'Time at which the execution log was created. Format is in milliseconds since Unix epoch.'
  createdAt : Integer64;
};

@title : 'ResourceData'
@description : 'Used to uniquely identify a resource in the SAP Business Technology Platform, for which this event was created.'
type Executions_types.resourceData {
  @description : 'Identifies the global account of an affected resource.'
  globalAccount : String;
  @description : 'Identifies the subaccount of an affected resource.'
  subAccount : String;
  @description : 'Identifies an additional resource isolation level.'
  resourceGroup : String;
  @description : 'Identifies the affected resource name.'
  resourceName : String;
  @description : 'Identifies the affected resource type.'
  resourceType : String;
  @description : 'Identifies the affected resource instance.'
  resourceInstance : String;
  @description : 'Optional key-value pairs providing additional information.'
  tags : { };
};

