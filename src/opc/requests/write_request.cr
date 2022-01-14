module OPC
  class WriteValue < BinData
    endian little

    def self.new(node, attribute, value)
      wr = WriteValue.new
      wr.node_id.value = node
      wr.attribute_id = attribute
      wr.value = value
      wr
    end

    def self.new(node : NodeID, attribute, value)
      wr = WriteValue.new
      wr.node_id = node
      wr.attribute_id = attribute
      wr.value = value
      wr
    end

    custom node_id : NodeID = NodeID.new
    uint32 attribute_id

    OPC.string index_range
    custom value : DataValue = DataValue.new
  end

  class WriteRequest < BinData
    endian little

    custom request_indicator : NodeID = NodeID.new(ObjectId[:write_request_encoding_default_binary])
    custom request_header : RequestHeader = RequestHeader.new

    OPC.array nodes_to_write : WriteValue
  end
end