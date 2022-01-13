class OPC::WriteResponse < BinData
  endian little

  property header : ResponseHeader? 
  def header; @header.not_nil!; end

  OPC.array results : StatusCode
  OPC.array diagnostic_infos : DiagnosticInfo
end