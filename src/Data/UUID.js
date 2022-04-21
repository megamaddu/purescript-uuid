// module Data.UUID

var mkV3UUID = null;
export const getUUID3Impl = function (str) {
  return function (namespace) {
    if (mkV3UUID === null) {
      var uuid = require('uuid');
      mkV3UUID = uuid.v3;
    }
    return mkV3UUID(str, namespace);
  };
};

var mkV4UUID = null;
export const getUUIDImpl = function () {
  if (mkV4UUID === null) {
    var uuid = require('uuid');
    mkV4UUID = uuid.v4;
  }
  return mkV4UUID();
};

var mkV5UUID = null;
export const getUUID5Impl = function (str) {
  return function (namespace) {
    if (mkV5UUID === null) {
      var uuid = require('uuid');
      mkV5UUID = uuid.v5;
    }
    return mkV5UUID(str, namespace);
  };
};

var validateUUID = null;
export const validateV4UUID = function (str) {
  if (validateUUID === null) {
    var uuid = require('uuid');
    validateUUID = uuid.validate;
  }
  return validateUUID(str);
};
