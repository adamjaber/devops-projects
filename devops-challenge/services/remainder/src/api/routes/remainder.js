const express = require("express");

const remainder = require("../../actions/remainder");
const { isNumber } = require("../../common");

const router = express.Router();

router.post("/", (request, response) => {
  const left = request.body && request.body.left;
  const right = request.body && request.body.right;

  if (!isNumber(left)) {
    return response
      .status(400)
      .send({ error: 'invalid "left" value, must be a number' });
  }

  if (!isNumber(right)) {
    return response
      .status(400)
      .send({ error: 'invalid "right" value, must be a number' });
  }
// if the right operand is 0 the return status 405
  if (right == 0){
    response.status(405).send({ error : 'Division by zero not allowd.'});
    return;
  }

  const result = remainder(left, right);

  return response.status(200).send({ type: "number", value: result });
});

module.exports = router;
