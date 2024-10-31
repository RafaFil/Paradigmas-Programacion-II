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
            //Modificarla para que se argumento retryFun pueda ser una función asíncrona.
            let wait = 0
            try {
                wait = await retryFn(atmp, currentTime-startingTime)
            } catch (error) {
                return error  //Si retry falla, como no dice que hacer en ese caso, retornamos el error 
            }
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

const main = async () => {
    const testCases = [
        [
            async () => (Promise.reject(false)), //ValueFn
            async (atmp, ms) => {return 5 - atmp -(await Promise.resolve(1))}, //RetryFn
            "Definir un caso de prueba con retryFun retornando una promesa resuelta con un número positivo."
        ],
        [
            async () => (Promise.reject(false)),
            async (atmp, ms) => (Promise.reject("This promise was inteded to be rejected D:")),
            "Definir un caso de prueba con retryFun retornando una promesa rechazada."
        ]
    ]

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





