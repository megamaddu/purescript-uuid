// module Data.UUID
import uuid from "uuid";

export const getUUID3Impl = function (str) {
  return function (namespace) {
    return uuid.v3(str, namespace);
  };
};

export const getUUIDImpl = uuid.v4;

export const getUUID5Impl = function (str) {
  return function (namespace) {
    return uuid.v5(str, namespace);
  };
};

export const validateV4UUID = uuid.validate;
