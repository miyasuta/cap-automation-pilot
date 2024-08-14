const cds = require('@sap/cds')

module.exports=class AutomationPilotService extends cds.ApplicationService{
    init(){
        this.on('getExecutions', async(req) => {
            const executionApi = await cds.connect.to('Executions')
            const response = await executionApi.send('GET', '/executions')
            return response
        })

        this.on('triggerCommand', async(req) => {
            const commandId = req.data.commandId
            const executionApi = await cds.connect.to('Executions')
            const response = await executionApi.send('POST', '/executions', {
                commandId: commandId
            })
            return response
        })
        return super.init()
    }
}