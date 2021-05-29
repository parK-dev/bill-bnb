const getTotal = () => {
  let startDateValue;
  let endDateValue;
  let totalDays;
  // SELECTS THE BOOKING START DATE INPUT
  if(document.getElementById('booking_start_date')){
    let startDateElement = document.getElementById('booking_start_date');
    startDateElement.addEventListener('change', (e) => {
      // CONVERT DAY TO NUMBER
      startDateValue = e.currentTarget.value.split('').slice(-2).join('');
      // SETS TOTAL DAY DIFFERENCE
      totalDays = parseInt(endDateValue, 10) - parseInt(startDateValue, 10);
      // SELECTES THE TOTAL FIELD
      let totalElement = document.getElementById('total')
      let price = totalElement.dataset.price
      if (startDateValue && endDateValue){
        totalElement.innerHTML = `$ ${totalDays * price}`
      }
    })
  }
    // SELECTS THE BOOKING END DATE INPUT
  if(document.getElementById('booking_end_date')) {
    let endDateElement = document.getElementById('booking_end_date');
    endDateElement.addEventListener('change', (e) => {
      // CONVERT DAY TO NUMBER
      endDateValue = e.currentTarget.value.split('').slice(-2).join('')
       // SETS TOTAL DAY DIFFERENCE
      totalDays = parseInt(endDateValue, 10) - parseInt(startDateValue, 10)
      // SELECTES THE TOTAL FIELD
      let totalElement = document.getElementById('total')
      let price = totalElement.dataset.price
      if (startDateValue && endDateValue){
        totalElement.innerHTML = `$ ${totalDays * price}`
      }
    })
  }
}

export { getTotal }
