function* g(n) {
    for (let i = 2; i <n; i*=i) yield i;
}

console.log([...g(17)])


const a = new Promise((resolve, reject) => {
    resolve(true);
});

a.then(res => { 
    console.log(res);
    throw new Error('Parameter is not a number!');
})
.catch(err => {
    console.error("Error capturado:", err.message);
});

// P1.then( () => p2)
// tres promesas P1, P2 y la promesa del then (p3)
// P1.then( () => p2, () => p4)

(new Promise( (resolve) => resolve(Promise.resolve(777))))
.then(res => console.log(res))

// La primera promesa se completa con el resultado de la segunda cuando se complete

function fn(promise) {
    return new Promise((res,rej)=> {
        promise.then(res,rej)
    })
}


function delay(sec, value) {

    return new Promise((resolve,rej) => {
        setTimeout(()=> {
            resolve(value !== undefined ? value : Date.now())
        }, sec)
    })

}

delay(100 * 5, null).then(res => console.log(res))

async function waitFor(p, timeout) {
    return new Promise((resolve,reject) => {

        setTimeout(()=> {
            reject("Taimou")
        }, timeout)

        p.then(resolve,reject)
    })
}



// waitFor(delay(100), 200).then(res => console.log(res))
// waitFor(delay(200),100).then(res => console.log(res)).catch(err => console.log(err))