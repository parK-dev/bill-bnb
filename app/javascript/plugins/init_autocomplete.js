import places from 'places.js';

const initAutocomplete = () => {
  console.log(places)
  const addressInput = document.getElementById('location_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
