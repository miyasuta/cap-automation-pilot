using { Executions_types } from './external/ExecutionsAPI';

service AutomationPilotService {
    function getExecutions() returns array of Executions_types.execution;
}