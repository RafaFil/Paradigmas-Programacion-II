function delay(sec, value) {

    return new Promise((resolve,rej) => {
        setTimeout(()=> {
            resolve(value !== undefined ? value : Date.now())
        }, sec)
    })

}
async function retry(valueFn, retryFn) {
    
    let atmp = 0
    let startingTime = (new Date()).getTime()

    while (true) {
        try {
            return await valueFn()
        } catch (error) {

            const currentTime = (new Date()).getTime()
            const wait = retryFn(atmp, currentTime-startingTime)
            if (wait > 0) {
                atmp ++
                console.log("Waiting For retry at ", {atmp})
                await delay(wait)
            }
            else {
                console.log(
                    !atmp ? "No Retries" :"Retry is no more"
                )
                return error
            }
        }
    }

}


const testCases = [
    [
        async () => (Promise.resolve(true)), //ValueFn
        (atmp, ms) => (0), //RetryFn
        "Promise that always resolve, should not retry"
    ],
    [
        async () => (Promise.reject(false)),
        (atmp, ms) => (-24),
        "Promise that always reject, should try to retry but RetryFn returns negative, so it never attempts to retry and returns the fail"
    ],
    [
        async () => (Promise.reject(false)),
        (atmp, ms) => {return 3 - atmp},
        "Promise will always reject, but retry will try to resolve for 3 times, failing everyone"
    ],
    [
        async () => {
            return new Promise((resolve,reject) => {
                const m = Math.floor(Math.random() * 2)
                if (m) {
                    resolve(true)
                }
                else {
                    reject(false)
                }
            })
        },
        (atmp, ms) => {return 3 - atmp},
        "Promise that could resolve or not, resolve if m == 1 else reject, will try three times -- NOT DETERMINISTIC, Result May Vary"
    ],
    [
        async () => (Promise.resolve(true)),
        (atmp, ms) => (0)
    ],
    [
        async () => (undefined),
        (atmp, ms) => (1)
    ],
    [
        async () => (Promise.resolve(true)),
        (atmp, ms) => (0)
    ],
    [
        async () => (Promise.resolve(true)),
        (atmp, ms) => (0)
    ],
    [
        async () => (Promise.resolve(true)),
        (atmp, ms) => (0)
    ],
    [
        async () => (Promise.resolve(true)),
        (atmp, ms) => (0)
    ]
]

const main = async () => {

    //Ignore, its for clarification on the terminal
    const colors = Object.freeze({
        RESET: "\x1b[0m",
        BLUE: "\x1b[34m",
        GREEN: "\x1b[32m",
        YELLOW: "\x1b[33m",
        GRAY: "\x1b[90m",
        BOLD: "\x1b[1m",
    });

    
    let i = 1
    for (const e of testCases) {
        console.log(`${colors.BLUE}TEST ${i}${colors.RESET}`);
        console.log(`${colors.GREEN}Description: ${e[2] ?? ''}${colors.RESET}`);
        console.log(`${colors.YELLOW}${colors.BOLD}${await retry(e[0], e[1])}${colors.RESET}`);
        console.log(`${colors.GRAY}-----------------${colors.RESET}`);
        i++
    }
    
}

main()