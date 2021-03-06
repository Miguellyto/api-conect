{
    "Order": {
      "tags": {
        "has_invoice_key": null,
        "has_invoice_xml": null,
        "has_invoice_pdf": null,
        "has_payment_form": null,
        "has_track": null,
        "has_track_url": null,
        "has_label": null
      },
      "commission": {
        "fixed": null,
        "tax": null,
        "total_charged": null,
        "comment": null
      },
      "status_history": [],
      "substatus_history": [],
      "log_history": [],
      "log_permanent": [],
      "payments": [
        {
          "payment_type": "credit", // select TIPO from TABELA
          "payment_method": "Nome do método como enviado pelo canal de venda",
          "payment_installments": "3", // select NUMPARCELA/NUMPARCELAS from PARCELA
          "payment_total": 100, 
          "payment_quota": 30,
          "payment_interest": 3,
          "payment_additional_info": null, // select DESCFINANCEIRO from PARCELA
          "external": null,
          "id": "6042121bb71e3422dafd2404"
        }
      ],
      "items": [ //select ITEMPEDIDOCOMPRA from PEDIDO
        {
          "commission": {
            "fixed": 4,
            "tax": 2,
            "total_charged": 10,
            "comment": null
          },
          "variation": {
            "attributes": [],
            "id": null, //SELECT chave FROM PEDIDO
            "name": null,//SELECT recurso FROM PEDIDO
            "external": null,
            "sku": null, //SELECT chave FROM PEDIDO
            "ean": null, //SELECT ean FROM RECURSO
            "photo_url": null
          },
          "quantity": 1, //SELECT quantidade FROM PEDIDO
          "sku": "486078", //SELECT chave FROM PEDIDO
          "price": 10, //SELECT custo FROM MOVDEPOS ou //SELECT fator FROM FATOR
          "total": 10, //SELECT total FROM PEDIDO
          "name": "PRODUTO XYZ", //SELECT recurso FROM PEDIDO
          "supplier_id": "136", //SELECT chave FROM PEDIDO
          "original_sku": "486078", //SELECT chave FROM PEDIDO
          "photo_url": "https://s3-sa-east-1.amazonaws.com/pluggto/129/129_043bffbd-6c7f-4ad4-9624-935167a90ce9.jpg",
          "id": null, //SELECT chave FROM PEDIDO
          "location": null, //SELECT DEPOSITO FROM MOVDEPOS
          "discount": null, //SELECT DESCONTO FROM PEDIDO 
          "external": null,
          "stock_code": null, //SELECT chave FROM PEDIDO
          "price_code": null, //SELECT chave FROM MOVDEPOS //SELECT CHAVE FROM FATOR
          "shipping_cost": null //SELECT frete FROM PEDIDO
        }
      ],
  
  
      "shipments": [], //Remessas
      "receiver_name": "Luizo", //select PESSOA from PEDIDO - //Nome do Recebedor
      "receiver_lastname": "Santos",
      "receiver_address_number": "440", //select NUMEROPESSOAOP from PEDIDO
      "receiver_address": "Rua do Bosque", //select LOGRADOUROPESSOAOP from PEDIDO
      "receiver_address_complement": "Ap 22", //select COMPLEMENTOPESSOAOP from PEDIDO
      "receiver_address_reference": "Prox a padaria",//select PONTOREFERPESSOAOP from PEDIDO
      "receiver_city": "São Paulo", //select LOCALIDADEPESSOAOP from PEDIDO
      "receiver_state": "São Paulo", //select UFPESSOAOP from PEDIDO 
      "receiver_email": "teste@teste.com.br", //Select EMAILPESSOA from PEDIDO //select YEMAIL from INTEGRACAO // Select EMAIL from tabela 
      "receiver_zipcode": "4457-115", //select CEPPESSOAOP from PEDIDO
      "receiver_phone": "119911-22111", //select FONE from ENTIDADE //
      "receiver_phone2_area": "21",null,
      "receiver_phone2": "9911-22112",null,
      "receiver_neighborhood": "Barra funda",null,
      "receiver_phone_area": "",null,

      "payer_name": "Luizo", SELECT PESSOA/PESSOACONTRATO FROM PARCELA
      "payer_lastname": "Santos",
      "payer_address": "Rua do Bosque",
      "payer_address_number": "440",
      "payer_address_complement": "Ap 22-Prox a padaria",
      "payer_additional_info": "Prox a padaria",
      "payer_neighborhood": "Mooca",
      "payer_city": "São Paulo",
      "payer_state": "São Paulo",
      "payer_zipcode": "4457-115",
      "payer_phone_area": "",
      "payer_phone": "112233-1111",
      "payer_phone2_area": "21",
      "payer_phone2": "2233-1111",
      "payer_cpf": "000.000.000-00",
      "payer_tax_id": "000.000.000-00",
      "payer_cnpj": "22.211.221/0001-21",
      "payer_document": "49.774.119-2",
      "payer_razao_social": "EMPRESA LTDA",
      "payer_company_name": "EMPRESA LTDA",
      "payer_country": "BR", //select PAISLOCESCRITUOP from PEDIDO
      "payer_email": "999999992016@mail.com.br",

      "total_paid": 18, //select TOTAL/TOTALDANOTA from PEDIDO
      "shipping": 10.21, //SELECT frete FROM PEDIDO - //Envio
      "subtotal": 7.789999999999999, //select SUBTOTAL from PEDIDO
      "discount": 81.79, //select DESCONTO from PEDIDO
      "total": 18, //select TOTALDANOTA/TOTALLIQUIDO from PEDIDO
      "user_client_id": "129", //SELECT EVENTO FROM USUARIO
      "status": "pending", //select STATUSNFE from PEDIDO //select YSTATUS from INTEGRACAO //select STATUS from EVENTO
      "original_id": "id_2_no_meu_sistema_teste_fix_5", //select CHAVE from INTEGRACAO //select CHAVE/CHCRIACAO/CRPEDIDO from PEDIDO
      "expected_send_date": "2016-11-05T00:00:00.000Z", //data de envio esperada
      "expected_delivery_date": "2016-11-05T00:00:00.000Z", //SELECT dataentrega FROM PEDIDO - //data prevista de entrega
      "receiver_schedule_date": "2016-11-05T00:00:00.000Z",
      "auto_reserve": true,
      "user_id": "129",//SELECT EVENTO FROM USUARIO
      "created": "2021-03-05T11:12:27.771Z", //select EMISSAOPED, EMISSAOPEDH from PEDIDO
      "created_by": "NTJhYTI3MTc4MDYyZjNk",
      "ack": false,
      "modified": "2021-03-09T18:22:24.198Z",
      "modified_by": "a106d72f997e5d3c8a08ce5c32e849b7",
      "timestamp": 1615314144,
      "discount_description": "Adicionado desconto de $81.78999999999999 referente ao valor de kits do pedido x valor de venda dos produtos que compõe o kit se vendido separadamente.",
      "order_id": 9151515193945684, //SELECT numeropedidocompra FROM PEDIDO
      "external": {
        "3be1315b01008eb77b5972693db69cd0": "100000532"
      },

      "receiver_additional_info": "Ap 22-Prox a padaria", //informações adicionais do receptor
      "receiver_country": "BR", 
      "input_service": null,
      "sub_status": null,
      "channel": null,
      "channel_account": null,
      "currency": "BRL", //Moeda
      "receiver_cpf": null,
      "receiver_schedule_period": "morning", //Agendamento de entrega
      "delivery_type": "standard", //Tipo de entrega
      "payer_fullname": null,
      "payer_gender": "male", //Gênero do pagador
      "payer_address_reference": null,
      "payer_schedule_date": null,
      "payer_schedule_period": null,
      "payer_ie": null,
      "payer_im": null,
      "deleted": null,
      "comission": null,
      "sale_intermediary": null,
      "payment_intermediary": null,
      "intermediary_seller_id": null,
      "invoicing_accepted": null,
      "invoicing_accepted_date": null,
      "shipping_accepted": null,
      "shipping_accepted_date": null,
      "delivery_accepted": null,
      "delivery_accepted_date": null,
      "invoicing_informed": null,
      "invoicing_informed_date": null,
      "shipping_informed": null,
      "shipping_informed_date": null,
      "delivery_informed": null,
      "delivery_informed_date": null,
      "sla_ship": null,
      "sla_delivery": null,
      "label_printed": null,
      "marked_as_delivered": null,
      "marked_as_shipped": null,
      "marked_as_invoiced": null,
      "id": "6042121bb71e3422dafd2400"
    }
  }

  ///////////////////////////QUERYS DO INO////////////////////////////////////////////////////////////////

  --Listar os Bancos de Dados
/* SELECT datname FROM pg_database; */

--Exibindo tabelas do Banco de Dados
/* SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'; */

--Selecionando Exibe os campos da tabela
 /* Select * from ILOG where 1 = 2; */

--Selecionar apenas o primeiro registro da tabela
/*  Select * from ILOG LIMIT 2; */

/* Select * from integracao LIMIT 2; */

--Visualizando as colunas de uma tabela
/* SELECT column_name FROM information_schema.columns WHERE table_name = 'recurso'; */

--Ver detalhes das colunas de uma tabela
/* SELECT * FROM information_schema.columns WHERE table_name ='recurso'; */

 /* Select * from PEDIDO where LIKE 'FOGAO 4B. ESMALTEC BALI CRISTAL BR' */

---TABELA RECURSO
select * from RECURSO
WHERE NOME LIKE '%ESMALTEC%'
LIMIT 10

select 
CHAVE, 
CODIGO, 
CLASSE, 
NOME, 
EAN, 
FABRICANTE, 
IMAGEM, 
MARCA, 
PRAZOGARANTIA, 
DESCRICAOGENERICA 
from RECURSO WHERE NOME LIKE '%ESMALTEC%';

/* ihour, idate --from PEDIDO LIMIT 2;*/

SELECT 
chave, 
ean,
nome, 
codigo,
classe,   
fabricante, 
imagem, 
marca, 
prazogarantia,
descricaogenerica, 
yecommerceskuid, 
yecommerceid,
yecommerceprodutopaiid,
yecommercenome,
yecommercedescricao,
yecommercecategoria,
yecommerceapelido
from RECURSO WHERE NOME LIKE '%ESMALTEC%';

/* SELECT
icreatedat,
iupdatedat
FROM CLASSE
LIMIT 10; */

SELECT
icreatedat,
iupdatedat,
icreation,
icreationhour,
ilastmodified,
ilastmodifiedhour
FROM iVfs
LIMIT 10;

SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';

---FATOR, CLASSE, Fatoresvenda
Select * from tabela where chave = -1898145931;
---1897048799, -1894333884, -1897148410

---Query imagem 
Select iKey, iVersion, iFieldNames, iBeforeValues
From iLog
Where iType = -1898145931 /* Registro Removido */;

--RASTREAMENTO DO PEDIDO:
SELECT 
PESSOA,
CHCRIACAO,
NUMERO, --DA NFE
EMISSAO,
CODIGORASTREIO
FROM PEDIDO;

--- Código de Rastreamento.ip (-1894804815) --- faturamento,frete e status
Select distinct p.PESSOA, p.NUMERO, p.EMISSAO, p.CHCRIACAO, p.YIDPEDIDO, e.CODIGO as CODIGORASTREIO, e.CHAVE as CHAVE_EVENTO
        From PEDIDO p
        join INTEGRACAO i on i.YIDPEDIDO = p.YIDPEDIDO
        left outer join EVENTO e on e.CRPEDIDO = p.CHCRIACAO and e.CLASSE = -1894804814 /* Código de Rastreamento */
        Where i.YAVISOFATURAMENTO is not null
            and p.OPERACAOCANCELADA is null
            and p.CHPEDBAIXA is not null
            and p.APROVACAO is not null
            and p.STATUSNFE = -1894641856 /* Enviada com Sucesso */
        " + whereExpress + "


--RASTREAMENTO DO PEDIDO:
SELECT 
PESSOA,
CHCRIACAO,
NUMERO, --DA NFE
EMISSAO,
CODIGORASTREIO
FROM PEDIDO;

{
"status":"shipping_informed",
"shipments":
 [{"id":"606b87e9e7cb7f1d4d5f8d33",  //select CHCRIACAO from PEDIDO
"shipping_company":"Correios",//SELECT TRANSPORTA FROM PEDIDO
"shipping_method":"PAC", //select TIPOFRETE from PEDIDO
"track_code":"11111", //select CODIGORASTREIO/RASTREIO from PEDIDO
"track_url":"http://correios.com.br",
"status":"shipped", //select STATUSNFE from PEDIDO //select YSTATUS from INTEGRACAO
"date_shipped":"2021-02-01" //select DATAEMBARQUE from PEDIDO
}]
}

SELECT 
CHCRIACAO,
TRANSPORTA,
TIPOFRETE,
CODIGORASTREIO/RASTREIO,
STATUSNFE
FROM PEDIDO;
select YSTATUS from INTEGRACAO
select DATAEMBARQUE from PEDIDO


--/Configuração/Fiscais/0100 Accounting.ic
this.camposInalteraveisDaNfe.push(
    "TIPO",
    "EMISSAOMOV",
    "NUMERO",
    "NUMEROSEQ",
    "SERIESUBS"//,
    //TODO: Rever uso dos campos abaixo, pois os mesmos podem ser alterados em outras situacoes, tais como cancelamento.
    //"CHACESSONFE",
    //"ENVIONFE",
    //"ENVIONFEH",
    //"PROTOCOLONFE",
    //"STATUSNFE",
    //"TIPOCONTINGENCIANFE",
    //"TIPOEMISSAONFE"
);

--- PrincipiaPedidoService.ijs (-1894804822) ---
        select
            YDATAINCLUSAO,
            MAX(YHORAINCLUSAO) as HORAINCLUSAO
        from
            INTEGRACAO
        where
            CLASSE = " + ECommerceConstantesCC.classes.INTEGRACAO_PEDIDO + "
            and YDATAINCLUSAO in (
                select
                    MAX(YDATAINCLUSAO) as DATAINCLUSAO
                from
                    INTEGRACAO
                where
                    CLASSE = " + ECommerceConstantesCC.classes.INTEGRACAO_PEDIDO + "
            )
        group by YDATAINCLUSAO;

---ECommercePedidoServiceCC.ijs (-1894804981)---
---ECommercePedidoServiceCC.prototype._pegarPedidosPendentesDeCriacao = function( ids ){

    var query = "
        select i.*
        from INTEGRACAO i
        where i.YLIBERACAOATENDIMENTO is not null
            and i.YENCERRAMENTO is null
            and not exists (
                select 1
                from PEDIDO p
                where p.YIDPEDIDO=i.YIDPEDIDO
                    and p.CHPEDBAIXA is null
                    and p.CHDEVOLUC is null
            ) " +
            queryUtilities.clauseWhereOfKeys("and", "i.CLASSE", classes.getChildren( ECommerceConstantesCC.classes.INTEGRACAO_PEDIDO )) +
            queryUtilities.clauseWhereOfKeys("and", "i.YIDPEDIDO", ids)

---ECommercePedidoServiceCC.prototype._pegarPedidosPendentesDeNotificacaoFaturamento = function( ids ){
    var integracao = database.query("
        select i.*
        from INTEGRACAO i
        where i.YAVISOFATURAMENTO is null
            and exists (
                select 1
                from PEDIDO p
                where p.YIDPEDIDO=i.YIDPEDIDO
                    and p.CHPEDBAIXA is null
                    and p.CHDEVOLUC is null
                    and exists (
                        select 1
                        from PEDIDO bx
                        where bx.CHPEDBAIXA=p.CHAVE
                            and bx.OPERACAOCANCELADA is null
                            and bx.STATUSNFE = " + ECommerceConstantesCC.statusNfe.EMITIDA + "
                    )
            ) " +
            queryUtilities.clauseWhereOfKeys("and", "i.CLASSE", classes.getChildren( ECommerceConstantesCC.classes.INTEGRACAO_PEDIDO )) +
            queryUtilities.clauseWhereOfKeys("and", "i.YIDPEDIDO", ids)
    );
    integracao.logChanges = true;

    return integracao;
};

---ECommercePedidoServiceCC.prototype._pegarPedidosPendentesDeNotificacaoCancelamento = function( ids ){
    var integracao = database.query("
        select i.yidpedido
        from INTEGRACAO i
        where i.YCANCELAMENTO is null
            and exists (
                select 1
                from PEDIDO p
                where p.YIDPEDIDO = i.YIDPEDIDO
                    and ( p.cancelamensaldo is not null or
                          exists (
                                select 1
                                from PEDIDO bx
                                where bx.CHPEDBAIXA = p.CHAVE
                                    and bx.OPERACAOCANCELADA is not null
                                    and bx.STATUSNFE = " + ECommerceConstantesCC.statusNfe.CANCELADA + "
                                ))
                )" +
            queryUtilities.clauseWhereOfKeys("and", "i.CLASSE", classes.getChildren( ECommerceConstantesCC.classes.INTEGRACAO_PEDIDO )) +
            queryUtilities.clauseWhereOfKeys("and", "i.YIDPEDIDO", ids)
    );
    integracao.logChanges = true;

    return integracao;
};
---ECommercePedidoServiceCC.prototype._pegarEventosDeCodigoRastreamentoPendentes = function(){
    var eventos = database.query("
        select e.*
        from EVENTO e
        where e.CLASSE = -1894804814 /* Código de Rastreamento */
            and DATA is null
    ");
    eventos.logChanges = true;

    return eventos;
};

---ECommercePedidoServiceCC.prototype._pegarNotaFiscais = function( idsPedidos ){
    if( !idsPedidos ){
        throw new Error("Informe os IDs dos pedidos!");
    }

    if( typeof idsPedidos == "string" ){
        idsPedidos = this.converter.preparaChaveParaConsultaDadosIntegracao( idsPedidos.toString().split(",") );
    }

    var notasFiscais = database.query("
        select distinct bx.CHAVE, bx.NUMERO, bx.CHACESSONFE, bx.EMISSAO, bx.EMISSAOH, bx.SERIESUBS, bx.RECURSO, bx.UNITARIO, bx.QUANTIDADE, bx.TOTAL, p.YIDPEDIDO
        from PEDIDO bx
            left outer join PEDIDO p on p.CHAVE=bx.CHPEDBAIXA
        where bx.CHPEDBAIXA is not null
            and bx.OPERACAOCANCELADA is null
            and bx.STATUSNFE = -1894641856 /* Enviada com Sucesso */
            and p.YIDPEDIDO in ( " + idsPedidos.join(', ') + ")"
    );

    return {
        cabecalhos: notasFiscais.sum("NUMERO;EMISSAO;EMISSAOH;SERIESUBS;YIDPEDIDO;CHACESSONFE", "TOTAL;QUANTIDADE"),
        itens: notasFiscais
    }
};

---/products/Web Commerce/library/objects/ecommerce/pesquisas/ECommerceConsultaPedidosCC.ijs
ECommerceConsultaPedidosCC.prototype._consultarNotificacoes = function( ids ){
    var notificacoes = database.query("
        select YIDPEDIDO as ID, DATA, HORA, USUARIO, SITUACAO
        from EVENTO " +
        queryUtilities.clauseWhereOfKeys("where", "CLASSE", classes.getChildren( ECommerceConstantesCC.classes.EVENTOS_ATENDIMENTO )) +
            queryUtilities.clauseWhereOfKeys("and", "YIDPEDIDO", ids )
    );

    this.notificacoes.append( notificacoes );


--/products/Web Commerce/library/objects/ecommerce/base/ECommercePedidoConverterCC.ijs
var endereco = dadosPessoa.endereco.split(" ");
        var tipologradouro = endereco[0];
        var tabelaTipoLogradouro = database.query("
        	select CHAVE
            from TABELA
            where
                CLASSE = -1897131373 and
                (CODIGO ilike '%" + tipologradouro + "%' or
                NOME ilike '%" + tipologradouro + "%')
         ");

--TABELA INTEGRACAO--
/* select
CHAVE,
VERSAOPEDIDO,
DATAGRAVACAOPEDIDO, --Retorna a data de criação do PEDIDO 
HORAGRAVACAOPEDIDO,
DADOSPEDIDO,
YAVISOFATURAMENTO,
YAVISOFATURAMENTOH,
YAVISOFATURAMENTOUSUARIO,
YDADOSPAGAMENTO,
YSITUACAOPAGAMENTO,
YDADOSPEDIDO,
YSTATUS,
YIDPEDIDO,
YEMAIL
from integracao LIMIT 2; */

--Regras de Pagamentos--
SELECT 
CODIGO,
NOME,
TIPO,
CHBANDEIRA,
REDEAUTORIZADORA,
CONDNEGOCIACAO,
YABSORVEPARCELAECOMMERCE,
YCONSIDERAFRETETITULO,
YCRIAPEDIDOCOMTITULOPENDENTE
FROM tabela where 1 = 2
select TOTAL from PEDIDO --Total do Pedido

---Tipos de pagamento
"payments" : [
 {
 "payment_total" : 24.56, // select TOTAL from PEDIDO 
 "payment_installments" : 1, // select NUMPARCELA from PARCELA
 "payment_method" : "credit_card", // select NOME from TABELA
 "payment_type" : "credit", // select TIPO from TABELA
 "_id" : ObjectId("5dacf4eef13005ee3cdc02d4") // select CODIGO from TABELA
 },
 ]

select TOTAL from PEDIDO
select
NUMPARCELA from PARCELA
NOME,
TIPO,
CODIGO 
from TABELA;


---MAIS CAMPOS DA TABELA "tabela"
SELECT 
CHAVE,
CODIGO,
COMISSAOP,
QUANTIDADE,
QUANTIDADE01,
RECURSO,
DEPOSITO,
FABRICANTE,
TEMZONACIDADE,
UF,
VALOR,
CONTA,
LOCALIDADE,
ALTURA,
PESO,
DIASENTREGA,
TOLEDMAIS,
TOLEDMENOS,
GARANTIA,
MARCA,
COR,
FATOR,
CLIENTE,
PESSOA,
NOME,
USUARIO,
EMAIL,
CADASTRADOR,
STATUS,
SITUACAO,
TIPOPESSOA,
LARGURA,
COMPRIMENTO,
FROM tabela where 1 = 2;

 Select * from PEDIDO where 1 = 2;
  Select * from PEDIDO LIMIT 2;

--TABELA PEDIDO
select
CHAVE,
CHCRIACAO,
RECURSO,
ITEM,
USUARIOPED,
USUARIO,
COMPRADOR,
DISPONIVELPED,
UNITARIO,
DESCITEMKIT,
ACRESITEMKIT,
COMISSVALOR1,
COMISSVALORPED1,
COMISSVALORTIT1,
COMISSFATOR1,
QUANTIDADE,
EMISSAOPED,
EMISSAOPEDH,
HORASISTEMAEMISSOR,
DATASISTEMAEMISSOR
HORACANCSISTEMAEMISSOR,
EMISSAODOCH,
EMISSAODOC,
EMISSAOUTC,
EMISSAOHUTC,
DATAEMBARQUE,
DATAEMBARQUEH,
DATAENTREGA,
RASTREIO,
RASTREIOCOMP,
TIPOFRETE,
FRETE,
TIPOFRETE,
TRANSPORTA,
DESCITEM,
DESCONTO,
ORIGEM,
SAIDAORIGEM,
DESTINO,
CHEGADADESTINO,
ENTREGA,
VOLQDETRANSP,
NUMEROPEDIDOCOMPRA,
PEDLOCESCTRANSF,
ITEMPEDIDOCOMPRA,
PRAZOGARANTIAM
YIDPEDIDO,
MOEDA,
NUMEROSERIE,
SERIESUBS,
EMAILPESSOA, 
EMAILTRANSPORTADOR,

STATUSCORRENTE, --status da NFE
CRPEDIDO, --CHAVE DE CRIAÇÃO PEDIDO
NUMERO, --DA NFE
SERIE, -- DA NFE
CFOP, -- DA NFE
PESSOA, --CLIENTE DO PEDIDO
PESSOAUF, --UF DO CLIENTE DA NFE
EMISSAO, --DATA DE EMISSÃO DA NFE
TIPO,
DATA_HORAPROTOCOLO, -- DA NFE
PEDIDO, --TOTAL DO PEDIDO
CHACESSONFE_PEDIDO --CHAVE DE ACESSO NFE

LOCENTREGA,
TOTAL,
SUBTOTAL,
TOTALDANOTA,
TOTALLIQUIDO,
TOTALBRUTO
from PEDIDO LIMIT 2;

--TABELA PESSOA--
SELECT EMAIL FROM PESSOA --CLASSE;

---PESSOA PEDIDO
SELECT
PESSOA,
PESSOAOP
LOGRADOUROPESSOAOP,
NUMEROPESSOAOP,
COMPLEMENTOPESSOAOP,
PONTOREFERPESSOAOP,
LOCALIDADEPESSOAOP,
CEPPESSOAOP,
UFPESSOAOP,
PAISPESSOAOP,
TIPOLOGRADOUROPESSOAOP,
SUBLOCALIDADEPESSOAOP,
ZONACIDADEPESSOAOP
FROM pedido;

---ESCRITUOP PEDIDO
select
NUMEROLOCESCRITUOP,
LOGRADOUROLOCESCRITUOP,
COMPLEMENTOLOCESCRITUOP,
PONTOREFERLOCESCRITUOP,
LOCALIDADELOCESCRITUOP,
UFLOCESCRITUOP,
CEPLOCESCRITUOP 
from PEDIDO;

---ENTIDADE
SELECT
ENTNOME,
ENTENDERECO,
ENTFONE,
ENTPONTOREFER,
ENTBAIRRO,
ENTUF,
ENTCEP,
ENTCIDADE
ENTLOCALIDADE,
ENTLOGRADOURO,
ENTCOMPLEMENTO,
ENTNUMERO,
ENTPAIS,
ENTTIPOLOGRADOURO,
ENTSUBLOCALIDADE
FROM pedido;

---Tabela VINCULA onde consta o "SALDO DO RECURSO"=Quantidade "ESTOQUE"
select
CHAVE,
RECURSO,
QUANTIDADE,
VALOR,
LOCESCRITU
from VINCULA WHERE NOME LIKE '%ESMALTEC%';

---Tabela FATOR, onde consta o FATOR=Preços dos RECURSOS=Produtos
SELECT * FROM FATOR LIMIT 10;
SELECT fator FROM FATOR;

select
CHAVE,
RECURSO,
QUANTIDADE,
CUSTO --Preço
from MOVDEPOS
LIMIT 10;

///////////////////////////QUERYS DO INO////////////////////////////////////////////////////////////////

---PRODUTO OK---
select 
    a.chave, 
    a.ean,
    '' as ncm,
    a.nome, 
    a.codigo,
    'quantidade' as quantidade,
    'preço especial' as preço_especial,
    b.fator as preço,
    a.descricaogenerica,
    a.marca, 
    'custo' as custo,
    a.prazogarantia,
    'observacao' as observacao,
    'link produto' as link_produto,
    'acessivel' as acessivel,
    a.classe,   
    'tempo manuseio' as tempo_manuseio,
    'tempo fabricacao' as tempo_fabricacao,
    a.comprimento as comprimento,
    a.largura as largura,
    a.altura as altura,
    a.pesbruunid as peso,
    'atributos' as atributos,
    'fotos' as fotos,
    'tabelas de preco' as tabela_preco,
    'deposito' as deposito,
    'variacoes' as variacoes
    from RECURSO a 
    join fator b
    on a.chave = b.recursoorig
    and b.tabfator = 462894
    and b.fim is null
where codigo = '1056'

---TIPOS DE PAGAMENTO
"payments" : [
 {
 "payment_total" : 24.56, // select TOTAL from PEDIDO //select VALOR from PARCELA
 "payment_installments" : 1, // select NUMPARCELA/NUMPARCELAS from PARCELA
 "payment_method" : "credit_card", // select NOME from TABELA
 "payment_type" : "credit", // select TIPO from TABELA
 "_id" : ObjectId("5dacf4eef13005ee3cdc02d4") // select CODIGO from TABELA //select CHAVE/CHCRIACAO from PARCELA
 },
 ]

select TOTAL from PEDIDO
select
NUMPARCELA/NUMPARCELAS from PARCELA
NOME,
TIPO,
CODIGO 
from TABELA;

--------CAMPOS OBRIGATÓRIOS PARA ATUALIZAR O PEDIDO
{
"status":("invoiced"/"shipping_informed"/"delivered"/"canceled"),//select SITUACAOPEDIDO/STATUSNFE from PEDIDO //select YSTATUS/STATUS from INTEGRACAO
"shipments":
[
(Guardar este ID para fazer atualizações futuras na entrega, do contrário serão criadas entregas duplicadas)
{"id":"32132311311", //SELECT IDPEDIDO/YIDPEDIDO FROM PEDIDO 
"shipping_company":"Correios", //SELECT TRANSPORTA FROM PEDIDO
"shipping_method":"PAC", //select TIPOFRETE from PEDIDO
"track_code":"11111", //select CODIGORASTREIO/RASTREIO from PEDIDO
"track_url":"http://correios.com.br", //'track_url' as track_url
"date_shipped":"2016-11-01", //select DATAEMBARQUE from PEDIDO
"nfe_key":"44444444444444444444444444444", //select CHACESSONFE_PEDIDO from PEDIDO
"nfe_link":"http://nfe.com.br/nsaasa", //'nfe_link' as nfe_link,
"nfe_number":"12", //select NUMERO from PEDIDO
"nfe_serie":"1", //select SERIE from PEDIDO
"nfe_date":"2016-11-01" //select EMISSAO from PEDIDO
}]
select STATUSNFE from PEDIDO //select YSTATUS/STATUS from INTEGRACAO
SELECT 
IDPEDIDO/YIDPEDIDO,  
TRANSPORTA, 
TIPOFRETE, 
CODIGORASTREIO/RASTREIO, 
'track_url' as track_url,
DATAEMBARQUE, 
DATAEMBARQUE, 
CHACESSONFE_PEDIDO, 
'nfe_link' as nfe_link,
NUMERO, 
SERIE, 
EMISSAO 
from PEDIDO;

--------ENVIO DO STATUS FATURADO 
{
"status":"invoiced",//select SITUACAOPEDIDO/STATUSNFE from PEDIDO //select YSTATUS/STATUS from INTEGRACAO
"shipments":
[{
"id":"5f2b3390832cf0523fa8c871", //select CHCRIACAO from PEDIDO
"status":"shipped",//select SITUACAOPEDIDO/STATUSNFE from PEDIDO //select YSTATUS/STATUS from INTEGRACAO
"date_shipped":"2020-08-05", //select DATAEMBARQUE from PEDIDO
"nfe_key":"858585858585858", //select CHACESSONFE_PEDIDO from PEDIDO
"nfe_link":"http://nfe.com.br/nsaasa", // 'nfe_link' as nfe_link,
"nfe_number":"12", //select NUMERO from PEDIDO
"nfe_serie":"1", //select SERIE from PEDIDO
"nfe_date":"2020-08-05" //select EMISSAO from PEDIDO
}]
}
select SITUACAOPEDIDO/STATUSNFE from PEDIDO //select YSTATUS/STATUS from INTEGRACAO
select 
CHCRIACAO, 
SITUACAOPEDIDO/STATUSNFE from PEDIDO //select YSTATUS/STATUS from INTEGRACAO
DATAEMBARQUE,
CHACESSONFE_PEDIDO,
'nfe_link' as nfe_link,
NUMERO,
SERIE,
EMISSAO
from PEDIDO;

--------RASTREAMENTO DO PEDIDO _ Envio do Status Despachado:
{
"status":"shipping_informed",select SITUACAOPEDIDO/STATUSNFE from PEDIDO //select YSTATUS/STATUS from INTEGRACAO
 [{
"id":"606b87e9e7cb7f1d4d5f8d33", //select IDPEDIDO/CHCRIACAO from PEDIDO
"status":"shipped", //select STATUSNFE from PEDIDO //select YSTATUS from INTEGRACAO
"date_shipped":"2021-02-01" //select DATAEMBARQUE from PEDIDO
"shipping_company":"Correios", //SELECT TRANSPORTA FROM PEDIDO
"shipping_method":"PAC", //select TIPOFRETE from PEDIDO
"track_code":"11111", //select CODIGORASTREIO/RASTREIO from PEDIDO
"track_url":"http://correios.com.br", //'track_url' as track_url
}]
} 
select SITUACAOPEDIDO/STATUSNFE from PEDIDO //select YSTATUS/STATUS from INTEGRACAO
select
IDPEDIDO/CHCRIACAO,
STATUSNFE, //select YSTATUS from INTEGRACAO
DATAEMBARQUE,
TRANSPORTA,
TIPOFRETE,
CODIGORASTREIO / RASTREIO,
'track_url' as track_url
from PEDIDO;

--QUERY PARA POWERBI
SELECT 
e.CODIGO || ' - ' || e.NOME || ' - ' || e.CGCCPF AS FILIAL,
e.ENDERECO || ' - ' || e.BAIRRO AS ENDERECO,
e.CIDADE,
t.CODIGO AS UF,
e.CEP,
p.CHAVE AS PEDIDO,
en.CODIGO || ' - ' || en.NOME || ' (' || en.CGCCPF || ') ' AS VENDEDOR,
r.NOME AS PRODUTO,
p.TOTALLIQUIDO AS PRECO,
p.QUANTIDADE AS QTD,
p.TOTAL,
P.EMISSAOPED AS DATAPED,
P.EMISSAOPEDH AS HORAPED
FROM PEDIDO p
JOIN ENTIDADE e
ON p.ESTABELECIPED = e.CHAVE
JOIN ENTIDADE en
ON p.REPRESENTA = en.CHAVE
JOIN TABELA t
ON p.UFPESSOAOP = t.CHAVE
JOIN RECURSO r
ON p.RECURSO = r.CHAVE
WHERE EMISSAOPED = '12/07/2019 00:00:00'
-- WHERE EMISSAOPED BETWEEN '11/07/2019 00:00:00' AND '12/07/2019 00:00:00'
LIMIT 20

-----
WHERE EMISSAOPED = '11/07/2019 00:00:00'
-- WHERE EMISSAOPED BETWEEN '11/07/2019 00:00:00' AND '12/07/2019 00:00:00'
-- OR EMISSAOPED BETWEEN '12/07/2019 00:00:00' AND '13/07/2019 00:00:00'
AND PRECO < 50.00
ORDER BY PRODUTO DESC
LIMIT 20