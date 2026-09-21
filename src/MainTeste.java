import br.com.signova.model.Parceiro;

public class MainTeste {
    public static void main(String[] args) {

        Parceiro parceiro = new Parceiro("Lazzarini", "43.508.566/0001-80", Parceiro.TipoParceria.COMISSAO);

        if (parceiro.getTipoParceria().equals(Parceiro.TipoParceria.COMISSAO)){
            System.out.println("Esse parceiro recebe Comissão");
        }
    }





}
