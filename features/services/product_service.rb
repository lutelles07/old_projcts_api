class ProductService

  include HTTParty

  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'X-tid'  => 'Products - '+ DateTime.now.strftime("%FT%T")

  def initialize(authentication)
    @auth = {
        username: AUTH[authentication]['username'],
        password: AUTH[authentication]['password']
    }
  end
  #==================================================================================================
  # PRODUCTS API
  #==================================================================================================

  def product_by_sku
    self.class.get("/aldebaran-products/products/#{$id}", :basic_auth => @auth)
  end

  def get_manufacturer
    self.class.get("/aldebaran-products/products/#{$id}/manufacturers", :basic_auth => @auth)
  end

  def get_departments
    self.class.get("/aldebaran-products/products/#{$id}/departments", :basic_auth => @auth)
  end

  def get_subdepartment
    self.class.get("/aldebaran-products/products/#{$id}/subdepartment", :basic_auth => @auth)
  end

  def get_suppliers
    self.class.get("/aldebaran-products/products/#{$id}/suppliers", :basic_auth => @auth)
  end

  def get_suppliers_cnpj
    self.class.get("/aldebaran-products/products/#{$id}/suppliers/#{$id_cnpj['CLIE_ID_TERCEIRO']}", :basic_auth => @auth)
  end

  def get_product_by_sku_and_limit_null
    self.class.get("/aldebaran-products/products", :basic_auth => @auth)
  end

  def get_product_by_sku_and_limit_101
    self.class.get("/aldebaran-products/products?limit=101", :basic_auth => @auth)
  end

  def get_product_by_sku_and_limit_1(limit)
    self.class.get("/aldebaran-products/products#{limit}", :basic_auth => @auth)
  end

end
