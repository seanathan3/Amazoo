const csrfFetch = async (url, options={}) => {
    options.headers ||= {};
    options.method ||= 'GET';
    options.headers['Content-Type'] ||= 'application/json';
    options.headers['X-CSRF-Token'] = sessionStorage.getItem('X-CSRF-Token');

    const res = await fetch(url, options);
    if (res.status >= 400) throw res;
    return res;   
}

export const storeCSRF = (res) => {
    const token = res.headers.get('X-CSRF-Token')
    if (token) sessionStorage.setItem('X-CSRF-Token', token)
}

export const restoreCSRF = async () => {
    const res = await csrfFetch('/api/session');
    storeCSRF(res);
    return res;
}


export default csrfFetch;