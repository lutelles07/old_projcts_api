class CreateB2bpartners_Invoices

  def self.template_one_invoice
    b2bpartners = YAML.load_file('./fixtures/templates/b2bpartners_invoice.yml')['create_invoice_01_occur'].dup
    return b2bpartners
  end


  def self.template_two_invoices
    b2bpartners = YAML.load_file('./fixtures/templates/b2bpartners_invoice.yml')['create_invoice_02_occurs'].dup
    return b2bpartners
  end


  def self.create_one_invoice(invoice_hash, noteID)

    b2bpartners = template_one_invoice

    # HEADER
    b2bpartners["debitNoteId"]    = noteID.to_s
    b2bpartners["totalValue"]     = invoice_hash["NFCA_VL_TOTAL_NOTA"].to_f
    b2bpartners["invoicesAmount"] = 1
    b2bpartners["issueDate"]      = invoice_hash["NFCA_DT_EMISSAO"].to_date.to_s
    b2bpartners["dueDate"]        = invoice_hash["DT_VENCTO"].to_date.to_s

    # DETAIL
    b2bpartners["invoices"][0]["branchId"]      = invoice_hash["NFCA_ID_FILIAL"]
    b2bpartners["invoices"][0]["invoiceNumber"] = invoice_hash["NFCA_ID_NOTA"]
    b2bpartners["invoices"][0]["serie"]         = invoice_hash["NFCA_SERIE"]
    b2bpartners["invoices"][0]["value"]         = invoice_hash["NFCA_VL_TOTAL_NOTA"].to_f
    b2bpartners["invoices"][0]["operationType"] = "AV"
    b2bpartners["invoices"][0]["instanceId"]    = nil

    return b2bpartners
  end


  def self.create_two_invoices(invoice_hash, noteID)

    b2bpartners = template_two_invoices

    # HEADER
    b2bpartners["debitNoteId"]    = noteID.to_s
    b2bpartners["totalValue"]     = invoice_hash[0]["NFCA_VL_TOTAL_NOTA"].to_f + invoice_hash[1]["NFCA_VL_TOTAL_NOTA"].to_f
    b2bpartners["invoicesAmount"] = 2
    b2bpartners["issueDate"]      = invoice_hash[0]["NFCA_DT_EMISSAO"].to_date.to_s
    b2bpartners["dueDate"]        = invoice_hash[0]["DT_VENCTO"].to_date.to_s

    # DETAIL (1)
    b2bpartners["invoices"][0]["branchId"]      = invoice_hash[0]["NFCA_ID_FILIAL"]
    b2bpartners["invoices"][0]["invoiceNumber"] = invoice_hash[0]["NFCA_ID_NOTA"]
    b2bpartners["invoices"][0]["serie"]         = invoice_hash[0]["NFCA_SERIE"]
    b2bpartners["invoices"][0]["value"]         = invoice_hash[0]["NFCA_VL_TOTAL_NOTA"].to_f
    b2bpartners["invoices"][0]["operationType"] = "AV"
    b2bpartners["invoices"][0]["instanceId"]    = nil

    # DETAIL (2)
    b2bpartners["invoices"][1]["branchId"]      = invoice_hash[1]["NFCA_ID_FILIAL"]
    b2bpartners["invoices"][1]["invoiceNumber"] = invoice_hash[1]["NFCA_ID_NOTA"]
    b2bpartners["invoices"][1]["serie"]         = invoice_hash[1]["NFCA_SERIE"]
    b2bpartners["invoices"][1]["value"]         = invoice_hash[1]["NFCA_VL_TOTAL_NOTA"].to_f
    b2bpartners["invoices"][1]["operationType"] = "AV"
    b2bpartners["invoices"][1]["instanceId"]    = nil

    return b2bpartners
  end


  def self.input_debitNoted(body_hash, value)

    case value
      when "null"
          body_hash["debitNoteId"] = nil
      else
          body_hash["debitNoteId"] = value.to_s
    end

    return body_hash
  end


  def self.input_totalValue(body_hash, value)

    case value
      when "null"
          body_hash["totalValue"] = nil
      when ""
          body_hash["totalValue"] = value
      else
          body_hash["totalValue"] = value.to_f
    end

    return body_hash
  end


  def self.input_invoicesAmount(body_hash, value)

    case value
      when "null"
        body_hash["invoicesAmount"] = nil
      when ""
        body_hash["invoicesAmount"] = value
      else
        body_hash["invoicesAmount"] = value.to_i
    end

    return body_hash
  end


  def self.input_issueDate(body_hash, value)

    case value
      when "null"
        body_hash["issueDate"] = nil
      else
        body_hash["issueDate"] = value.to_s
    end

    return body_hash
  end


  def self.input_dueDate(body_hash, value)

    case value
      when "null"
        body_hash["dueDate"] = nil
      else
        body_hash["dueDate"] = value.to_s
    end

    return body_hash
  end


  def self.input_branchId(body_hash, value)

    case value
      when "null"
        body_hash["invoices"][0]["branchId"] = nil
      when ""
        body_hash["invoices"][0]["branchId"] = value
      else
        body_hash["invoices"][0]["branchId"] = value.to_i
    end

    return body_hash
  end


  def self.input_invoiceNumber(body_hash, value)

    case value
      when "null"
        body_hash["invoices"][0]["invoiceNumber"] = nil
      when ""
        body_hash["invoices"][0]["invoiceNumber"] = value
      else
        body_hash["invoices"][0]["invoiceNumber"] = value.to_i
    end

    return body_hash
  end


  def self.input_serie(body_hash, value)

    case value
      when "null"
        body_hash["invoices"][0]["serie"] = nil
      else
        body_hash["invoices"][0]["serie"] = value.to_s
    end

    return body_hash
  end


  def self.input_value(body_hash, value)

    case value
      when "null"
        body_hash["invoices"][0]["value"] = nil
      when ""
        body_hash["invoices"][0]["value"] = value
      else
        body_hash["invoices"][0]["value"] = value.to_f
    end

    return body_hash
  end


  def self.input_operationType(body_hash, value)

    case value
      when "null"
        body_hash["invoices"][0]["operationType"] = nil
      else
        body_hash["invoices"][0]["operationType"] = value.to_s
    end

    return body_hash
  end


  def self.input_instanceId(body_hash, value)

    case value
      when "null"
        body_hash["invoices"][0]["instanceId"] = nil
      else
        body_hash["invoices"][0]["instanceId"] = value.to_s
    end

    return body_hash
  end

end
