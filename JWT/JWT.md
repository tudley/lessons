# Introduction

JSON Web Token (JWT) is an open standard that defines a compact and self-contained way for securely transmitting information between parties as a JSON object.

This information can be verified and trusted as it is digitally signed. JWTs can be siugned using a secret of a public/private ket pair using RSA or ECDSA

JWT's can also be encrypted to provide secrecy between parties, or just _signed_ - which can verify the integrity of the claims contained within it.

Use cases:

- Authorization
  - Once a user is logged in, each subsequent request will include the users JWT, allowing them permissions based on their token. SSO widely uses this mechanism

- Information exchange
  - They are good for securely transmissitng ofmration becauyse they are signed, you can be sure the senders are who they say they are. Also the signature is calculated using the header and payload, so you can verify that the content hasnt been tampered with.

# Structure

JWTs consts if 3 parts: - Header - Payload - Signature

Therefore, looking like
xxxxx.yyyyy.zzzzz

## The Header

The header will consist of 2 parts:

- The type of token (JWT)
- The signing algorithm used (eg. SHA256, RSA, HMAC)

All of this is Base64Url encoded to form the first part

## The Payload

The payload containsd the claims. Claims are statements about an entity (the user)

This could look like:

{
"sub": "1234567890",
"name": "John Doe",
"admin": true
}

All of this is again Base64Url encoded to form the second part

## The Signature

To make the signature, you take the encoded header, the encoded paylaod, a secret, the algrith specified in the header, and sign that.

eg. HMACSHA256(base64UrlEncode(header) + "." + base64UrlEncode(payload), secret)
