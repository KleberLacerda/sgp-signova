package br.com.signova;

import br.com.signova.calculadora.CalculadoraComissao;
import br.com.signova.model.Parceiro;
import br.com.signova.model.Venda;

public class Main {
    public static void main(String[] args) {

        Parceiro lazzarini = new Parceiro("45.858.457/0001-88", "Lazzarini",  Parceiro.TipoParceria.COMISSAO);

        Parceiro mello = new Parceiro("84.777.541/0001-99", "Mello",Parceiro.TipoParceria.REVENDA);

        Parceiro wm = new Parceiro("123.333.455-00", "WM", Parceiro.TipoParceria.REPASSE);

        Parceiro agm = new Parceiro("12.345.678/0001-91", "AGM", Parceiro.TipoParceria.LOTE);

        lazzarini.dadoCadastral("858.545.656-99", "lazzarini@gmail.com", "11 98756-0988", "Av santo andré 80");


        CalculadoraComissao calculadoraComissao = new CalculadoraComissao(0.10);
        System.out.println("FECHAMENTO MENSAL\n");
        System.out.println(lazzarini.getNome() +  " - total a receber: " + calculadoraComissao.calcular(2000,100));

        Venda v = new Venda();
        System.out.println("\nStatus da venda: " + wm.getNome() + v.getStatusVenda());
        v.criarVenda("tyt-yui-oop", 180, Venda.StatusVenda.PENDENTE);
        v.finalizarVenda();
        System.out.println("\nCertificado enviado para " + wm.getNome() + " - Status da venda: " + v.getStatusVenda() + "\nValor: " + v.getValorVenda());

    }
}
