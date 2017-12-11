class StockUnitService
  include HTTParty

  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'X-tid'  => 'StockUnit-'+ DateTime.now.strftime("%FT%T")

  def initialize(authentication)
    @auth = {
        username: AUTH[authentication]['username'],
        password: AUTH[authentication]['password']
    }
  end

#==================================================================================================
# StockUnit API
#==================================================================================================

  def get_stockunit_id
    self.class.get("/aldebaran-stockunit/stockunits/#{$id_stockunit}", :basic_auth => @auth)
  end

  def get_stockunit_id_duplicate
    self.class.get("/aldebaran-stockunit/stockunits/?stockUnit=#{$id_stockunit}&stockUnit=#{$id_stockunit}", :basic_auth => @auth)
  end

  def get_stockunit_querystring
    self.class.get("/aldebaran-stockunit/stockunits/?ean=#{$ean}&plant=#{$plant}&warrantyId=#{$warranty}&inventoryLocationId=#{$inventorylocation_id}", :basic_auth => @auth)
  end

  def get_stockunit_querystring_parameter_invalid
    self.class.get("/aldebaran-stockunit/stockunits/?ean=aaaaaaa&plant=#{$plant}&warrantyId=#{$warranty}&inventoryLocationId=#{$inventorylocation_id}", :basic_auth => @auth)
  end

  def get_stockunit_querystring_invalid
    self.class.get("/aldebaran-stockunit/stockunits/?ean=1&plant=WM7&warrantyId=65&inventoryLocationId=25341384", :basic_auth => @auth)
  end

  def stockunit_querystring_without_ean
    self.class.get("/aldebaran-stockunit/stockunits/?plant=WM7&warrantyId=65&inventoryLocationId=25341384", :basic_auth => @auth)
  end

  def stockunit_querystring_without_plant
    self.class.get("/aldebaran-stockunit/stockunits/?ean=7896525071471&warrantyId=65&inventoryLocationId=25341384", :basic_auth => @auth)
  end

  def stockunit_querystring_without_warrantyId
    self.class.get("/aldebaran-stockunit/stockunits/?ean=7896525071471&plant=WM7&inventoryLocationId=25341384", :basic_auth => @auth)
  end

  def stockunit_querystring_without_inventoryLocationId
    self.class.get("/aldebaran-stockunit/stockunits/?ean=7896525071471&plant=WM7&warrantyId=65", :basic_auth => @auth)
  end

  def get_stockunit_multiple_id
    self.class.get("/aldebaran-stockunit/stockunits/?stockUnit=#{$stockunit[0]['ID']}&stockUnit=#{$stockunit[1]['ID']}", :basic_auth => @auth)
  end

  def get_stockunit_id_invalid
    self.class.get("/aldebaran-stockunit/stockunits/aaaaaaa", :basic_auth => @auth)
  end

  def get_stockunit_id_resurce_not_found
    self.class.get("/aldebaran-stockunit/stockunits/1999999999", :basic_auth => @auth)
  end

end
