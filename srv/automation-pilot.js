const cds = require('@sap/cds')

module.exports=class AutomationPilotService extends cds.ApplicationService{
    init(){
        this.on('getExecutions', async(req) => {
            //https://cap.cloud.sap/docs/node.js/core-services#srv-send-request
            const executionApi = await cds.connect.to('Executions')
            // const response = await executionApi.send('executions')
            const response = await executionApi.send({
                method: 'GET',
                path: '/executions'
            })
            console.log("response:", response)
            return response
        })
        return super.init()
    }
}