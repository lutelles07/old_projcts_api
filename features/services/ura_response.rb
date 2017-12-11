class AldebaranUraResponse

  def self.response_call(response)
    call_response = Nokogiri::XML(response.to_hash[:executar_interface_ura_response][:executar_interface_ura_result])
  end

  def self.response_call_obter_itens_atualizados(response)
    call_response = response.to_hash[:obter_itens_atualizados_response][:obter_itens_atualizados_result]
  end

end
