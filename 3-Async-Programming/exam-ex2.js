function* nums(n) {
    for (let x = 0; x < n; x++) yield x;
}

async function asyncSquare(x) {
    return Promise.resolve(x ** 2);
}

async function mapAsync(gen, fn) {
    return await Promise.all(gen.map(async (n) => (
        await fn(n)
    )))
}

mapAsync(nums(5), asyncSquare).then(console.log);