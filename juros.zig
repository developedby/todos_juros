﻿// Cálculo do juros, sendo que precisa de arrays pra isso
// Versão 0.1: 17/06/2024: versão feita sem muito conhecimento de Zig

const std = @import("std");
const math = std.math;

// estutura básica para simplificar as chamadas
const Juros = struct {
    quantidade: i16,
    composto: bool,
    periodo: f64,
    pagamentos: [3]f64, // alterar esses valores
    pesos: [3]f64, // para sua necessidade

    // calcula a somatória de pesos[]
    pub fn getPesoTotal(self: Juros) f64 {
        var acumulador: f64 = 0.0;
        var indice: usize = 0;
        while (indice < self.quantidade) {
            acumulador += self.pesos[indice];
            indice += 1;
        }
        return acumulador;
    }

    // calcula o acréscimo a partir dos juros e parcelas
    pub fn jurosParaAcrescimo(self: Juros, juros: f64) f64 {
        const pesoTotal = self.getPesoTotal();
        if (juros <= 0.0 or self.quantidade < 1 or self.periodo <= 0.0 or pesoTotal <= 0.0) {
            return 0.0;
        }
        var acumulador: f64 = 0.0;
        var indice: usize = 0;

        while (indice < self.quantidade) {
            if (self.composto) {
                acumulador += self.pesos[indice] / math.pow(f64, 1 + juros / 100.0, self.pagamentos[indice] / self.periodo);
            } else {
                acumulador += self.pesos[indice] / (1 + juros / 100.0 * self.pagamentos[indice] / self.periodo);
            }
            indice += 1;
        }

        return (pesoTotal / acumulador - 1.0) * 100.0;
    }

    // calcula os juros a partir do acréscimo e parcelas
    pub fn acrescimoParaJuros(self: Juros, acrescimo: f64, precisao: f64, maxIteracoes: i16, maximoJuros: f64) f64 {
        const pesoTotal = self.getPesoTotal();
        if (acrescimo <= 0.0 or self.quantidade < 1 or self.periodo <= 0.0 or pesoTotal <= 0.0 or precisao < 1 or maxIteracoes < 1 or maximoJuros <= 0.0) {
            return 0.0;
        }
        var minJuros: f64 = 0.0;
        var medJuros: f64 = maximoJuros / 2.0;
        var maxJuros: f64 = maximoJuros;
        const minDiferenca: f64 = math.pow(f64, 0.1, precisao);
        var indice: usize = 0;

        while (indice < maxIteracoes) {
            medJuros = (minJuros + maxJuros) / 2.0;
            if ((maxJuros - minJuros) < minDiferenca) {
                return medJuros;
            }
            if (self.jurosParaAcrescimo(medJuros) < acrescimo) {
                minJuros = medJuros;
            } else {
                maxJuros = medJuros;
            }

            indice += 1;
        }

        return medJuros;
    }
};

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    // cria um objeto oJuros do tipo Juros e incializa os valores
    const pagamentos = [_]f64{ 30.0, 60.0, 90.0 };
    const pesos = [_]f64{ 1.0, 1.0, 1.0 };
    const oJuros = Juros{ .quantidade = 3, .composto = true, .periodo = 30.0, .pagamentos = pagamentos, .pesos = pesos };

    // calcula e guarda os retornos das funções
    const pesoTotal: f64 = oJuros.getPesoTotal();
    const acrescimoCalculado: f64 = oJuros.jurosParaAcrescimo(3.0);
    const jurosCalculado: f64 = oJuros.acrescimoParaJuros(acrescimoCalculado, 15.0, 100, 50);

    // imprime os resultados
    try stdout.print("Peso total = {d}\n", .{pesoTotal});
    try stdout.print("Acrescimo = {d}\n", .{acrescimoCalculado});
    try stdout.print("Juros = {d}\n", .{jurosCalculado});
}
