# python numerical-result.py

import cudaq
import numpy as np
from functools import reduce

cudaq.set_target('nvidia')

qubit_num=2

@cudaq.kernel
def psi(num:int):
    q=cudaq.qvector(num)
    h(q[1])
    
@cudaq.kernel
def phi(n:int):
    q=cudaq.qvector(n)
    x(q[0])

psi_state=cudaq.get_state(psi,qubit_num)
print('Psi state: ', psi_state)

phi_state=cudaq.get_state(phi,qubit_num)
print('Phi state: ', phi_state)

ham=cudaq.spin.x(0)*cudaq.spin.x(1)
ham_matrix=ham.to_matrix()
print('hamiltonian: ', np.array(ham_matrix))

exp_val=reduce(np.dot,(np.array(psi_state).conj().T, ham_matrix, phi_state))

print('Numerical expectation value: ', exp_val) 