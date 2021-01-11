String getErrorHasuraString(String code) {
  switch (code) {
    case 'Uniqueness violation. duplicate key value violates unique constraint "usuario_cpf_key"':
      return 'CPF já cadastrado no sistema.';
    
    default:
      return 'Algo deu errado.';
  }
}
