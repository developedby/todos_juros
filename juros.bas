�� � Calculo dos juros, sendo que precisa de arrays para isso � � Versao 0.1: 26/05/2024: �_ � variaveis globais e atribuicao de valores d QUANTIDADE% �  !n COMPOSTO% �  6x PERIODO# �   p� U� � PAGAMENTOS#(QUANTIDADE%) o� � PESOS#(QUANTIDADE%) �� � INDICE% �  � QUANTIDADE% �� PAGAMENTOS#(INDICE%) �  � INDICE% �� PESOS#(INDICE%) �    � �� � INDICE% '� testa os retornos das funcoes ,� � 06� "Peso total =", PESOTOTAL# C@JUROS# �   @� MJ� � mT� "Acrescimo =", ACRESCIMO# �^PRECISAO% �  �hMAXITERACOES% � d �rMAXJUROS# �   H� �|ACRESCIMOPARAM# � ACRESCIMO# ��� � ��� "Juros =", JUROS# ��� �PESOTOTAL# �      -�� INDICE% �  � QUANTIDADE% [PESOTOTAL# � PESOTOTAL# � PESOS#(INDICE%) i� INDICE% o� ��� calcula o acrescimo a partir dos juros e parcelas ��ACRESCIMO# �      ��� JUROS# ��      � � ��� QUANTIDADE% �  � � � PERIODO# ��      � � � � 6� PESOTOTAL# ��      � � N$ACUMULADOR# �      n.� INDICE% �  � QUANTIDADE% �8� COMPOSTO% �  � L :� � �LACUMULADOR# � ACUMULADOR# � PESOS#(INDICE%) � (   � � JUROS# �   H�) � (PAGAMENTOS#(INDICE%)�PERIODO#) V�  q�ACUMULADOR# � ACUMULADOR# � PESOS#(INDICE%) � (   � � JUROS# �   H� � PAGAMENTOS#(INDICE%)�PERIODO#) {��  �� INDICE% �ACRESCIMO# � (PESOTOTAL#�ACUMULADOR#�   �)�  H� �(� ��� calcula os juros a partir do acrescimo e parcelas �JUROS# �      ,�� MAXITERACOES% �  � � F�� QUANTIDADE% �  � � ^�� PRECISAO% �  � � z� PERIODO# ��      � � �� ACRESCIMO# ��      � � �� MAXJUROS# ��      � � �"� � �,� PESOTOTAL# ��      � � �6MINJUROS# �      @JUROS# � MAXJUROS# �    � 8JMINDIFERENCA# � ��L} � PRECISAO% ZT� INDICE% �  � MAXITERACOES% �^JUROS# � (MINJUROS# � MAXJUROS#) �    � �h� (MAXJUROS# � MINJUROS#) � MINDIFERENCA# � � �r� � |� ACRESCIMO# � ACRESCIMOPARAM# � MINJUROS# � JUROS# :� MAXJUROS# � JUROS# �� INDICE% %��   