class AldebaranClient < Savon::Client

  def initialize(globals = {}, &block)
    default_globals = {
      wsdl: ENVIRONMENT["server"]+"/aldebaran-ura/ws/ura.wsdl",
      ssl_verify_mode: :none
    }
    super(default_globals.merge(globals), &block)
  end

  def order_by_id(id)
    self.call(:executar_interface_ura, message: { 'idPedidoCliente' => id })
  end

  def client_by_cpf(cpf)
    self.call(:executar_interface_ura, message: { 'cpfCliente' => cpf })
  end

  def order_by_id_invalid(id)
    self.call(:executar_interface_ura, message: { 'idPedidoCliente' => id })
  end

  def client_by_cpf_invalid(cpf)
    self.call(:executar_interface_ura, message: { 'cpfCliente' => cpf })
  end

  def obter_itens_atualizados
    Aldebaran_Ura.new.atualizar_items
    self.call(:obter_itens_atualizados, message: {})
  end

end
