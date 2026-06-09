import math
import secrets

# Helper function to find a prim number


def is_prime(n):
    """Return True/False if the number is prime or not"""
    if n < 2:
        return False

    for i in range(2, int(math.sqrt(n)) + 1):
        if n % i == 0:
            return False

    return True


def find_next_prime(n):
    """Iterate from a starting point, and find the next prime number"""
    n += 1
    while not is_prime(n):
        n += 1
    return n


def get_factors(n):
    """
        Get all the numbers which multiply to make the number

        Example:
            imagine the number 18:
            18 / 2 is whole number
            18 / 2 = 9
            n is now 9
            factors appends 2

            9 / 2 is not whole number
            9 / 3 is whole number
            9 / 3 = 3
            n is now 3
            factors appends 3

            3 / 2 is not whole
            3 / 3 = 1
            smallest factor reached
            return factors
    """
    factors = []
    smallest_factor = False
    current_divisor = 2

    while not smallest_factor:
        if n % current_divisor == 0:
            if current_divisor == n:
                smallest_factor = True
                continue
            else:
                n = n/current_divisor
                factors.append(int(n))
                factors.append(int(current_divisor))
                current_divisor = 2
                continue
        else:
            current_divisor += 1
    factors = set(factors)
    return factors


def get_coprime(n):
    """Coprime contains no common factors with the target integer"""
    # Get factors of the input
    factors = get_factors(n)
    coprime_found = False
    potential_coprime = 4
    while not coprime_found:
        potential_coprime_factors = get_factors(n=potential_coprime)
        no_factors_in_common = True
        for factor in potential_coprime_factors:
            if factor in factors:
                no_factors_in_common = False
                break
        if no_factors_in_common:
            return potential_coprime
        else:
            potential_coprime += 1


factors = get_factors(18)  # factors = [2, 3, 9]
coprime = get_coprime(18)  # smallest coprime = 5


# --------------------
# ---- Main method ---
# --------------------

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
start_counting_from = 10000000
p = find_next_prime(n=start_counting_from)
q = find_next_prime(n=p)

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
e = get_coprime(n=phi)

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
decrypted_bytes = decrypted_as_int.to_bytes(128, "big")
decrypted_string = decrypted_bytes.decode("utf-8")
print("Decrypted: ", decrypted_string)
