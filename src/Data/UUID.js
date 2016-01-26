'use strict';

// module Data.UUID

var uuid = require('uuid');

exports.getUUIDImpl = function () {
  return uuid.v4();
};
