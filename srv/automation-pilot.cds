using { Executions_types } from './external/ExecutionsAPI';

service AutomationPilotService {
    function getExecutions() returns array of Executions_types.execution;
    function triggerCommand(commandId: String) returns Executions_types.execution;
}