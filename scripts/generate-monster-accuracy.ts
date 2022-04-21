let accuracies: number[] = []
let baseAccuracy = 250;
const generateAccuracy = () => {
    accuracies.push(250)
    for (let i = 0; i < 100; i++) {
        baseAccuracy+= Math.floor((baseAccuracy * 4) / 100);
        accuracies.push(baseAccuracy);
    }
    console.log(JSON.stringify(accuracies))
}


generateAccuracy()

export default generateAccuracy;