import axios from 'axios';

const API_BASE_URL = 'http://localhost:8080/api';

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

export const authService = {
  login: (credentials) => api.post('/auth/login', credentials),
  register: (userData) => api.post('/auth/register', userData),
};

export const equipmentService = {
  getAllEquipments: () => api.get('/equipments'),
  createEquipment: (equipment) => api.post('/equipments', equipment),
  generateReport: (equipmentIds) => api.post('/reports/generate', { equipmentIds }),
};

export default api;
