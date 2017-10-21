export function initialize(container) {
  container.lookup('service:session').initialize_from_cookie()
  console.log('session initialized')
}

export default {
  initialize
};
