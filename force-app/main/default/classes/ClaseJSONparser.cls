public class ClaseJSONparser {
	
    public ClaseJSONparser(){
        
    }
     
    public void probandoJSON(){
        String body = '{"code":"SUCCESS","error":null,"result":{"payload":[{"id":100697557,"accountId":550645,"status":"CAPTURED","referenceCode":"100000057","description":"Producto Prueba","airlineCode":null,"language":"es","notifyUrl":"http://www.tiendapublicar.com/index.php/payu/payment/notify/","shippingAddress":{"street1":null,"street2":null,"city":null,"state":null,"country":"CO","postalCode":null,"phone":null},"buyer":{"merchantBuyerId":null,"fullName":"diana melo","emailAddress":"diana.melo@publicar.com","contactPhone":null},"antifraudMerchantId":null,"transactions":[{"id":"3cf7dbbb-cd10-4aed-8b21-309e945eb9cd","order":null,"creditCard":null,"bankAccount":null,"type":"AUTHORIZATION_AND_CAPTURE","parentTransactionId":null,"paymentMethod":"PSE","source":null,"paymentCountry":"CO","transactionResponse":{"state":"APPROVED","paymentNetworkResponseCode":"SUCCESS","paymentNetworkResponseErrorMessage":null,"trazabilityCode":"174130999","authorizationCode":null,"pendingReason":"AWAITING_NOTIFICATION","responseCode":"APPROVED","errorCode":null,"responseMessage":null,"transactionDate":null,"transactionTime":null,"operationDate":null,"extraParameters":null},"deviceSessionId":"5eda653edf01da854a4e1e7fabe9b80f","ipAddress":"186.85.70.187","cookie":"pol_186_85_70_187_1449176523799","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36","expirationDate":null,"payer":{"merchantPayerId":null,"fullName":"diana melo","billingAddress":{"street1":null,"street2":null,"city":null,"state":null,"country":"CO","postalCode":null,"phone":null},"emailAddress":"diana.melo@publicar.com","contactPhone":"57 3182821192","dniNumber":"52715645"},"additionalValues":{"TX_ADDITIONAL_VALUE":{"value":0.00,"currency":"COP"},"TX_VALUE":{"value":10440.00,"currency":"COP"},"PAYER_INTEREST_VALUE":{"value":0.00,"currency":"COP"},"PM_TAX_RETURN_BASE":{"value":9000.00,"currency":"COP"},"PM_VALUE":{"value":10440.00,"currency":"COP"},"COMMISSION_VALUE":{"value":2900.00,"currency":"COP"},"PM_NETWORK_VALUE":{"value":10440.00,"currency":"COP"},"PM_ADDITIONAL_VALUE":{"value":0.00,"currency":"COP"},"PM_TAX":{"value":1440.00,"currency":"COP"},"TX_TAX_RETURN_BASE":{"value":9000.00,"currency":"COP"},"PAYER_PRICING_VALUES":{"value":0.00,"currency":"COP"},"PM_PURCHASE_VALUE":{"value":9000.00,"currency":"COP"},"TX_TAX":{"value":1440.00,"currency":"COP"},"MERCHANT_COMMISSION_VALUE":{"value":3364.00,"currency":"COP"},"PAYER_COMMISSION_VALUE":{"value":0.00,"currency":"COP"},"MERCHANT_INTEREST_VALUE":{"value":0.00,"currency":"COP"}},"extraParameters":{"MERCHANT_PROFILE_ID":"6804927f-38bb-4325-9e7e-c6907556278f","MAX_SHIPPING_MERCHANT":"0","CHECKOUT_VERSION":"V2","MIN_SHIPPING_PAYER":"0","MAX_SHIPPING_PAYER":"0","TRANSACTION_CYCLE":"-1","USER_TYPE":"N","MIN_SHIPPING_MERCHANT":"0","FINANCIAL_INSTITUTION_CODE":"1007","BANK_URL":"https://pse.todo1.com/PseBancolombia/control/ElectronicPayment.bancolombia?PAYMENT_ID=25196176418369019917562417689","INSTALLMENTS_NUMBER":"1","PRICING_PROFILE_GROUP_ID":"f65720ab-5bed-4667-bcf9-83e51388a25f","PERCENT_SHIPPING_MERCHANT":"0","PSE_REFERENCE1":"186.85.70.187","NETWORK_CALLBACK_URL":"https://checkout.payulatam.com/ppp-web-gateway-payu//response/pseDirect/","PSE_REFERENCE3":"52715645","FINANCIAL_INSTITUTION_NAME":"BANCOLOMBIA","PSE_REFERENCE2":"CC"}}],"additionalValues":{"TX_ADDITIONAL_VALUE":{"value":0.00,"currency":"COP"},"TX_VALUE":{"value":10440.00,"currency":"COP"},"PAYER_INTEREST_VALUE":{"value":0.00,"currency":"COP"},"PM_TAX_RETURN_BASE":{"value":9000.00,"currency":"COP"},"PM_VALUE":{"value":10440.00,"currency":"COP"},"PM_NETWORK_VALUE":{"value":10440.00,"currency":"COP"},"PM_ADDITIONAL_VALUE":{"value":0.00,"currency":"COP"},"PM_TAX":{"value":1440.00,"currency":"COP"},"TX_TAX_RETURN_BASE":{"value":9000.00,"currency":"COP"},"PAYER_PRICING_VALUES":{"value":0.00,"currency":"COP"},"PM_PURCHASE_VALUE":{"value":9000.00,"currency":"COP"},"TX_TAX":{"value":1440.00,"currency":"COP"},"MERCHANT_COMMISSION_VALUE":{"value":3364.00,"currency":"COP"},"PAYER_COMMISSION_VALUE":{"value":0.00,"currency":"COP"},"MERCHANT_INTEREST_VALUE":{"value":0.00,"currency":"COP"}}}]}}';
        String name;
        String company;
        String jefe;
        String aprobado;
        Decimal valor;
        String compra;
        String email;
        
        JSONParser parser = JSON.createParser(body);
        while(parser.nextToken() != null){
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME){
               String fieldName = parser.getText();
                parser.nextToken();
                if(fieldName == 'code' ){
                    name = parser.getText();
                }else if(fieldName == 'emailAddress'){
                    company = parser.getText();
                }else if(fieldName == 'fullName'){
                    jefe = parser.getText();
                }else if(fieldName == 'responseCode'){
                    aprobado = parser.getText();
                }else if(fieldName == 'value'){
                    valor = parser.getDecimalValue();
                }else if(fieldName == 'PM_PURCHASE_VALUE'){
                    compra = parser.getText();
                }else if(fieldName == 'emailAddress'){
                    email = parser.getText();
                }
            }
        }
        System.debug('nombre: '+name);
        System.debug('compañia: '+company);
        System.debug('jefe: '+jefe);
        System.debug('Aprobacion: '+aprobado);
        System.debug('Valor: '+valor);
        System.debug('Compra: '+compra);
        System.debug('Correo: '+email);
    }

    
}