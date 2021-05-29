









const getTotal = () => {
  let startDateValue;
  let endDateValue;
  let totalDays;
  if(document.getElementById('booking_start_date')){

    let startDateElement = document.getElementById('booking_start_date');
    startDateElement.addEventListener('change', (e) => {
      startDateValue = e.currentTarget.value.split('').slice(-2).join('');
      totalDays = parseInt(endDateValue, 10) - parseInt(startDateValue, 10);

      let totalElement = document.getElementById('total')
      let price = totalElement.dataset.price
      if (startDateValue && endDateValue){
        totalElement.innerHTML = `$ ${totalDays * price}`
      }
    })
  }
  if(document.getElementById('booking_end_date')) {
    let endDateElement = document.getElementById('booking_end_date');
    endDateElement.addEventListener('change', (e) => {
      endDateValue = e.currentTarget.value.split('').slice(-2).join('')
      totalDays = parseInt(endDateValue, 10) - parseInt(startDateValue, 10)

      let totalElement = document.getElementById('total')
      let price = totalElement.dataset.price
      if (startDateValue && endDateValue){
        totalElement.innerHTML = `$ ${totalDays * price}`
      }
    })
  }
}

export { getTotal }
