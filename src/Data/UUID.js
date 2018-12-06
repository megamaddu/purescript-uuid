'use strict';

// module Data.UUID

var mkV3UUID = null;
exports.getUUID3Impl = function (str) {
  return function (namespace) {
    if (mkV3UUID === null) mkV3UUID = require('uuid/v3');
    return mkV3UUID(str, namespace);
  };
};

var mkV4UUID = null;
exports.getUUIDImpl = function () {
  if (mkV4UUID === null) mkV4UUID = require('uuid/v4');
  return mkV4UUID();
};

var mkV5UUID = null;
exports.getUUID5Impl = function (str) {
  return function (namespace) {
    if (mkV5UUID === null) mkV5UUID = require('uuid/v5');
    return mkV5UUID(str, namespace);
  };
};

var validateV4UUID = null;
exports.validateV4UUID = function (str) {
  if (validateV4UUID === null) validateV4UUID = require('uuid-validate');
  return validateV4UUID(str, 4);
};
