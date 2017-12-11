class DeliveryRepository

    def get_delivery_id
        delivery_id_list = []
        @delivery_queries = YAML::load(File.open('database_queries/deliveries.yml'))
        query = @delivery_queries["get_delivery_id"]
        delivery_id_list = DatabaseService.new.execute_query(query)
        delivery_id = delivery_id_list[Random.new.rand(delivery_id_list.size)]["PEDC_ID_PEDIDO"]
    end

    def get_delivery_data_by_id(delivery_id)
        delivery_id_list = []
        @delivery_queries = YAML::load(File.open('database_queries/deliveries.yml'))
        query = @delivery_queries["get_delivery_data"]
        query = query.gsub("<delivery-id>", delivery_id.to_s)
        delivery_id_list = DatabaseService.new.execute_query(query)
        convert_delivery_list_array_to_delivery_list_hash(delivery_id_list)
    end

    private
    def convert_delivery_list_array_to_delivery_list_hash(delivery_id_list)
        delivery_hash_list = []
        delivery_id_list.each do |record_item|
            record_hash = @delivery_queries["get_delivery_data_hash"]
            record_hash["orderId"] = record_item["ORDER_ID"]
            record_hash["customerName"] = record_item["COSTUMER_NAME"]
            record_hash["orderDate"] = record_item["ORDER_DATE"]
            record_hash["customerCode"] = record_item["CUSTOMER_CODE"]
            record_hash["customerPhone1"] = record_item["FONE1"]
            record_hash["customerPhone2"] = record_item["FONE2"]
            record_hash["channel"] = record_item["CHANNEL"]
            record_hash["storeName"] = record_item["STORE_NAME"]
            record_hash["deliveryDiscountAmount"] = record_item["DELIVERY_DISCOUNT_AMOUNT"]
            record_hash["deliveryTotalAmount"] = record_item["DELIVERY_TOTAL_AMOUNT"]
            record_hash["deliveryFreightAmount"] = record_item["DELIVERY_FREIGHT_AMOUNT"]
            record_hash["deliveryProductAmount"] = record_item["DELIVERY_PRODUCT_AMOUNT"]
            record_hash["orderDiscountAmount"] = record_item["ORDER_DISCOUNT_AMOUNT"]
            record_hash["orderFreightAmount"] = record_item["ORDER_FREIGHT_AMOUNT"]
            record_hash["orderTotalAmount"] = record_item["ORDER_TOTAL_AMOUNT"]
            record_hash["orderProductAmount"] = record_item["ORDER_PRODUCT_AMOUNT"]
            record_hash["orderItems"] = record_item["ORDER_ITEMS"]
            record_hash["deliveryItems"] = record_item["DELIVERY_ITEMS"]
            record_hash["deliveryItemsApproved"] = record_item["DELIVERY_ITEMS_APPROVED"]
            record_hash["paymentMethod"] = record_item["PAYMENT_METHOD"]
            record_hash["billingName"] = record_item["BILLING_NAME"]
            record_hash["billingCustomerName"] = record_item["BILLING_CUSTOMER_NAME"]
            record_hash["billingAddress"] = record_item["BILLING_ADDRESS"]
            record_hash["billingNeighborhood"] = record_item["BILLING_NEIGHBORHOOD"]
            record_hash["billingZipCode"] = record_item["BILLING_ZIPCODE"]
            record_hash["billingCity"] = record_item["BILLING_CITY"]
            record_hash["billingState"] = record_item["BILLING_STATE"]
            record_hash["shippingName"] = record_item["SHIPPING_NAME"]
            record_hash["shippingAddress"] = record_item["SHIPPING_ADDRESS"]
            record_hash["shippingNeighborhood"] = record_item["SHIPPING_NEIGHBORHOOD"]
            record_hash["shippingZipCode"] = record_item["SHIPPING_ZIPCODE"]
            record_hash["shippingCity"] = record_item["SHIPPING_CITY"]
            record_hash["shippingState"] = record_item["SHIPPING_STATE"]
            record_hash["shippingDate"] = record_item["SHIPPING_DATE"]
            record_hash["lastTrackingDate"] = record_item["LAST_TRACKING_DATE"]
            record_hash["carrierName"] = record_item["CARRIER_NAME"]
            record_hash["labelNumber1"] = record_item["LABEL_NUMBER1"]
            record_hash["labelNumber2"] = record_item["LABEL_NUMBER2"]
            record_hash["labelNumber3"] = record_item["LABEL_NUMBER3"]
            record_hash["labelNumber4"] = record_item["LABEL_NUMBER4"]
            record_hash["labelNumber5"] = record_item["LABEL_NUMBER5"]
            record_hash["cancellationSentence"] = record_item["CANCELLATION_SENTENCE"]
            record_hash["lastTrackingTime"] = record_item["LAST_TRACKING_TIME"]
            record_hash["receivedLastTrackingTime"] = record_item["RECEIVE_LAST_TRACKING_TIME"]
            record_hash["correio"] =  record_item["CORREIO"]

            record_hash = convert_value_nil_to_empty(record_hash)

            delivery_hash_list << record_hash
        end

        delivery_hash_list
    end

    def convert_value_nil_to_empty(record_hash)
        record_hash.keys.each do |key|
            if record_hash[key] != nil
                if record_hash[key].start_with?"#"
                    record_hash[key] = " "
                end
            end

            case record_hash[key]
                when nil
                    record_hash[key] = " "
            end
            if (key == "correio")
                if (record_hash[key] == 'N')
                    record_hash[key] = false
                else
                    record_hash[key] = true
                end
            end

            if (key == "customerCode")
                 record_hash[key] = record_hash[key].to_i
            end
        end
        record_hash
    end

end
