// Auto-generated. Do not edit!

// (in-package fasterrcnn.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class output {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.output = null;
    }
    else {
      if (initObj.hasOwnProperty('output')) {
        this.output = initObj.output
      }
      else {
        this.output = new Array(4).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type output
    // Check that the constant length array field [output] has the right length
    if (obj.output.length !== 4) {
      throw new Error('Unable to serialize array field output - length must be 4')
    }
    // Serialize message field [output]
    bufferOffset = _arraySerializer.float32(obj.output, buffer, bufferOffset, 4);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type output
    let len;
    let data = new output(null);
    // Deserialize message field [output]
    data.output = _arrayDeserializer.float32(buffer, bufferOffset, 4)
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'fasterrcnn/output';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b0921ba9077f39adb4c574ad1d537831';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[4] output
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new output(null);
    if (msg.output !== undefined) {
      resolved.output = msg.output;
    }
    else {
      resolved.output = new Array(4).fill(0)
    }

    return resolved;
    }
};

module.exports = output;
