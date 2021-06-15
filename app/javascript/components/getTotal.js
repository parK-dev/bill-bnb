

const getTotal = () => {
  let startDateValue;
  let endDateValue;
  let regex = /(\d*[^-])/g;

// SETS THE TOTAL AMOUNT AND RENDERS IT TO THE BOOKING FORM
  const setTotal = () => {
    // CALCULATES DIFFERENCE IN DAYS BETWEEN THE TWO DATES
    let diffTime = Math.abs(endDateValue - startDateValue);
    let diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));


    // SELECTES THE TOTAL FIELD
    let totalPriceElement = document.getElementById('total')
    let totalDiv = document.getElementsByClassName('total-price-wrapper')
    let price = totalPriceElement.dataset.price

    // RENDERS THE TOTAL IF THERE'S A START AND END DATE
    if (startDateValue && endDateValue){
      totalPriceElement.innerHTML = `$ ${diffDays * price}`
      console.log(totalDiv)
      totalDiv[0].style.height = '42px'
      totalDiv[0].style.transition = 'all .2s ease-in'
    }


  }



  // SELECTS THE BOOKING START DATE INPUT
  if(document.getElementById('booking_start_date')){
    let startDateElement = document.getElementById('booking_start_date');
    startDateElement.addEventListener('change', (e) => {

    // SETS NEW DATE OBEJECT WITH THE DATE SELECTED FOR START DATE
    startDateValue = new Date(e.currentTarget.value.match(regex).join('/'))

    setTotal()
    })
  }
    // SELECTS THE BOOKING END DATE INPUT
  if(document.getElementById('booking_end_date')) {
    let endDateElement = document.getElementById('booking_end_date');
    endDateElement.addEventListener('change', (e) => {

    // SETS NEW DATE OBEJECT WITH THE DATE SELECTED FOR END DATE
    endDateValue = new Date(e.currentTarget.value.match(regex).join('/'))

    setTotal()
    })
  }
}

export { getTotal }


// const date1 = new Date('7/13/2010');
// const date2 = new Date('12/15/2010');

