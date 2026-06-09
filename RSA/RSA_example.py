# -----------------------------------------
#  Step 1. Create the message and encode it
# -----------------------------------------

# Message to be encoded and decoded
message = "A"
print("Unencrypted: ", message)

# Encode the message to bytes
message_bytes = message.encode("utf-8")

# Encode the bytes to an integer
m = int.from_bytes(message_bytes, "big")
print("Message as int: ", m)


# ---------------------------------------------
#  Step 2. Create the RSA encryption parameters
# ---------------------------------------------

# Pick 2 prime numbers
# NOTE: the product of these, N must be larger than m
p = 3
q = 5

# Find the product of the primes
n = p * q
print("n: ", n)
print("m < n: ", m < n)
if not (m < n):
    print("""
        The encoded message must be smaller than the product of the 2 primes, otherwise:
        big number % small number
        loses a lot of data
        """
          )

# Find the Eulers Totient of n
phi = (p-1)*(q-1)
# phi = 8

# Pick a number for e (coprime with phi)
e = 7

# Find d
d = pow(e, -1, phi)
# d = 7
print(d)

# Create the key values
private_key = (n, d)
public_key = (n, e)

# -------------------------------------------------
#  Step 3. Encrypt the message using RSA encryption
# -------------------------------------------------

encrypted = (m ** e) % n
print("Encrypted: ", encrypted)

# -----------------------------
#  Step 4.  Decrypt the message
# -----------------------------

decrypted_as_int: int = (encrypted ** d) % n
decrypted_bytes = decrypted_as_int.to_bytes(2, "big")
decrypted_string = decrypted_bytes.decode("utf-8")
print("Decrypted: ", decrypted_string)
