'use strict';

// module Data.UUID

var mkV4UUID = null;
exports.getUUIDImpl = function () {
  if (mkV4UUID === null) mkV4UUID = require('uuid').v4;
  return mkV4UUID();
};

var validateV4UUID = null;
exports.validateV4UUID = function (str) {
  if (validateV4UUID === null) validateV4UUID = require('uuid-validate');
  return validateV4UUID(str, 4);
};
