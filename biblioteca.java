//    ### 1. Exercício 1 (Java - POO)

//    *Crie um arquivo chamado `Biblioteca.java` (ou cole no seu ambiente de desenvolvimento Java) com a estrutura completa das classes abstratas, herança e a lógica de empréstimo/devolução com polimorfismo:*

    ```java
    abstract class ItemBiblioteca {
        protected String codigo;
        protected String titulo;
        protected boolean disponivel;

        public ItemBiblioteca(String codigo, String titulo) {
            this.codigo = codigo;
            this.titulo = titulo;
            this.disponivel = true;
        }

        public String getCodigo() { return codigo; }
        public String getTitulo() { return titulo; }
        public boolean isDisponivel() { return disponivel; }

        public abstract int getPrazoDias();
        public abstract double getValorMultaDiaria();
    }

    class Livro extends ItemBiblioteca {
        public Livro(String codigo, String titulo) { super(codigo, titulo); }
        @Override public int getPrazoDias() { return 14; }
        @Override public double getValorMultaDiaria() { return 0.50; }
    }

    class Revista extends ItemBiblioteca {
        public Revista(String codigo, String titulo) { super(codigo, titulo); }
        @Override public int getPrazoDias() { return 7; }
        @Override public double getValorMultaDiaria() { return 1.00; }
    }

    abstract class Usuario {
        protected String nome;
        protected int quantidadeEmprestada;

        public Usuario(String nome) {
            this.nome = nome;
            this.quantidadeEmprestada = 0;
        }

        public String getNome() { return nome; }
        public int getQuantidadeEmprestada() { return quantidadeEmprestada; }
        public void incrementarEmprestimo() { this.quantidadeEmprestada++; }
        public void decrementarEmprestimo() { if (this.quantidadeEmprestada > 0) this.quantidadeEmprestada--; }

        public abstract int getLimiteItens();
    }

    class Aluno extends Usuario {
        public Aluno(String nome) { super(nome); }
        @Override public int getLimiteItens() { return 3; }
    }

    class Professor extends Usuario {
        public Professor(String nome) { super(nome); }
        @Override public int getLimiteItens() { return 5; }
    }

    class BibliotecaSistema {
        private ItemBiblioteca[] acervo;
        private int totalItens;

        public BibliotecaSistema(int capacidadeMax) {
            this.acervo = new ItemBiblioteca[capacidadeMax];
            this.totalItens = 0;
        }

        public void cadastrarItem(ItemBiblioteca item) {
            if (totalItens < acervo.length) {
                acervo[totalItens++] = item;
            }
        }

        public boolean emprestar(ItemBiblioteca item, Usuario usuario) {
            if (!item.isDisponivel() || usuario.getQuantidadeEmprestada() >= usuario.getLimiteItens()) {
                System.out.println("-> Empréstimo recusado para " + usuario.getNome() + ".");
                return false;
            }
            item.disponivel = false;
            usuario.incrementarEmprestimo();
            System.out.println("-> Sucesso: '" + item.getTitulo() + "' emprestado para " + usuario.getNome() + ".");
            return true;
        }

        public void listarAcervo() {
            System.out.println("\n--- ACERVO ---");
            for (int i = 0; i < totalItens; i++) {
                ItemBiblioteca item = acervo[i];
                System.out.println(item.getCodigo() + " | " + item.getTitulo() + " | Disponível: " + item.isDisponivel());
            }
        }
    }

    ```
