# RSA Encryption

The security fo RSA is based on the fact it is easy to calculate the product of 2 large prime numbers (_p_ and _q_), but very difficult to determine the 2 primes only from the proudct of them (_n_).

### Step 1 :Set prime numbers

Pick 2 prime numbers, _p_ and _q_

    p=11
    q=13

### Step 2: Calculate key values

Calculate the 2 keys.

    Private key: (n, d)
    Public key: (n, e)

### Step 2.1

To calculate _n_, multiply _p_ and _q_:

    n = p . q
    n = 11 . 13
    **n = 143**

### Step 2.2

To get the values of _e_ and _d_, the Euler phi function is used.

It calculates how many of the numbers less than or equal to n are coprime to n

    *coprime - 2 numbers that share no common factors (apart from 1). eg. 8 and 15 are coprime, even though neither are prime*

    ϕ(n)=(p−1)⋅(q−1)
    ϕ(143)=(11−1)⋅(13−1)
    ϕ(143)=120

### Step 2.3

The number _e_ can be chosen freely, but it must be coprime to ϕ(n) (120)

    **e = 17**

### Step 2.4

The number _d_ is the multiplicative inverse to _e_

    Multiplicative inverse: d * e = 1, so d = 1/e

This means:
(e⋅d)modϕ(n)=1

**So d must equal 113**

    (113 * 17) % 120 = 1

### Step 3: Encrypt

To encrypt a number _m_ to ciphertext _c_, the following forumula is applied:

c = m^e mod(n)

Example:

    m = 88
    c = 88 ^ 17 mod (143)
    c = 121

### Step 4: decrypt

For decryption, the inverse of the formula is applied:

m′= c^d mod(n)

Example:
c = 121 ^ 113 mod(143)
c = 88

### Notes

Though this example uses numbers, we can convert the numbers to letters using an encoding system such as ASCII
