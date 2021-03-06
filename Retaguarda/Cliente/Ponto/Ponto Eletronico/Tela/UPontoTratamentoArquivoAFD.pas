{ *******************************************************************************
Title: T2Ti ERP
Description: Janela Tratamento de Registros para o Ponto Eletr�nico

The MIT License

Copyright: Copyright (C) 2016 T2Ti.COM

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

The author may be contacted at:
t2ti.com@gmail.com</p>

@author Albert Eije (alberteije@gmail.com)
@version 2.0
******************************************************************************* }
unit UPontoTratamentoArquivoAFD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ActnList, RibbonSilverStyleActnCtrls,
  ActnMan, ToolWin, ActnCtrls, DBXJSON, UBase, Menus, MaskUtils, LabeledCtrls,
  Mask, JvExMask, JvToolEdit, Generics.Collections, StrUtils, WideStrings,
  FMTBcd, Biblioteca, ComCtrls, System.Actions, Vcl.Imaging.pngimage, Controller;

type
  TFPontoTratamentoArquivoAFD = class(TFBase)
    CDSRegistro3: TClientDataSet;
    DSRegistro3: TDataSource;
    PanelCabecalho: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    ActionToolBarGrid: TActionToolBar;
    ActionManagerLocal: TActionManager;
    ActionSalvar: TAction;
    ActionImportarArquivo: TAction;
    ActionSair: TAction;
    CDSColaboradorPis: TClientDataSet;
    CDSColaboradorPisPIS_NUMERO: TStringField;
    CDSColaboradorPisNOME: TStringField;
    CDSPontoMarcacao: TClientDataSet;
    CDSPontoMarcacaoID: TIntegerField;
    CDSPontoMarcacaoID_COLABORADOR: TIntegerField;
    CDSPontoMarcacaoID_PONTO_RELOGIO: TIntegerField;
    CDSPontoMarcacaoNSR: TIntegerField;
    CDSPontoMarcacaoDATA_MARCACAO: TDateField;
    CDSPontoMarcacaoHORA_MARCACAO: TStringField;
    CDSPontoMarcacaoTIPO_MARCACAO: TStringField;
    CDSPontoMarcacaoTIPO_REGISTRO: TStringField;
    CDSPontoMarcacaoJUSTIFICATIVA: TStringField;
    CDSRegistro3Nsr: TStringField;
    CDSRegistro3TipoRegistro: TStringField;
    CDSRegistro3DataMarcacao: TStringField;
    CDSRegistro3HoraMarcacao: TStringField;
    CDSRegistro3NumeroPis: TStringField;
    CDSRegistro3JUSTIFICATIVA: TStringField;
    CDSRegistro3NOME_COLABORADOR: TStringField;
    CDSRegistro3SITUACAO_REGISTRO: TStringField;
    CDSRegistro3TIPO_MARCACAO: TStringField;
    CDSRegistro3TIPO_REGISTRO: TStringField;
    ActionValidarDados: TAction;
    PopupMenu: TPopupMenu;
    DesconsiderarMarcao1: TMenuItem;
    RemoverRegistroIncludo1: TMenuItem;
    CDSRegistro3NumeroSerieRep: TStringField;
    CDSPontoRelogio: TClientDataSet;
    CDSPontoRelogioID: TIntegerField;
    CDSPontoRelogioID_EMPRESA: TIntegerField;
    CDSPontoRelogioLOCALIZACAO: TStringField;
    CDSPontoRelogioMARCA: TStringField;
    CDSPontoRelogioFABRICANTE: TStringField;
    CDSPontoRelogioNUMERO_SERIE: TStringField;
    CDSPontoRelogioUTILIZACAO: TStringField;
    CDSRegistro3ID_PONTO_RELOGIO: TIntegerField;
    CDSRegistro3ID_COLABORADOR: TIntegerField;
    CDSColaboradorPisID: TIntegerField;
    CDSPontoMarcacaoPAR_ENTRADA_SAIDA: TStringField;
    CDSRegistro3PAR_ENTRADA_SAIDA: TStringField;
    CDSPontoEscalaTurma: TClientDataSet;
    CDSPontoEscalaTurmaID: TIntegerField;
    CDSPontoEscalaTurmaID_EMPRESA: TIntegerField;
    CDSPontoEscalaTurmaNOME: TStringField;
    CDSPontoEscalaTurmaDESCONTO_HORA_DIA: TStringField;
    CDSPontoEscalaTurmaDESCONTO_DSR: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_DOMINGO: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_SEGUNDA: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_TERCA: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_QUARTA: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_QUINTA: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_SEXTA: TStringField;
    CDSPontoEscalaTurmaCODIGO_HORARIO_SABADO: TStringField;
    CDSPontoEscalaTurmaCODIGO_TURMA: TStringField;
    CDSPontoHorario: TClientDataSet;
    CDSPontoHorarioID: TIntegerField;
    CDSPontoHorarioID_EMPRESA: TIntegerField;
    CDSPontoHorarioTIPO: TStringField;
    CDSPontoHorarioCODIGO: TStringField;
    CDSPontoHorarioNOME: TStringField;
    CDSPontoHorarioTIPO_TRABALHO: TStringField;
    CDSPontoHorarioCARGA_HORARIA: TStringField;
    CDSPontoHorarioENTRADA01: TStringField;
    CDSPontoHorarioSAIDA01: TStringField;
    CDSPontoHorarioENTRADA02: TStringField;
    CDSPontoHorarioSAIDA02: TStringField;
    CDSPontoHorarioENTRADA03: TStringField;
    CDSPontoHorarioSAIDA03: TStringField;
    CDSPontoHorarioENTRADA04: TStringField;
    CDSPontoHorarioSAIDA04: TStringField;
    CDSPontoHorarioENTRADA05: TStringField;
    CDSPontoHorarioSAIDA05: TStringField;
    CDSPontoHorarioHORA_INICIO_JORNADA: TStringField;
    CDSPontoHorarioHORA_FIM_JORNADA: TStringField;
    CDSRegistro3CODIGO_TURMA_PONTO: TStringField;
    CDSColaboradorPisCODIGO_TURMA_PONTO: TStringField;
    CDSPontoParametro: TClientDataSet;
    CDSPontoParametroID: TIntegerField;
    CDSPontoParametroID_EMPRESA: TIntegerField;
    CDSPontoParametroMES_ANO: TStringField;
    CDSPontoParametroDIA_INICIAL_APURACAO: TIntegerField;
    CDSPontoParametroHORA_NOTURNA_INICIO: TStringField;
    CDSPontoParametroHORA_NOTURNA_FIM: TStringField;
    CDSPontoParametroPERIODO_MINIMO_INTERJORNADA: TStringField;
    CDSPontoParametroPERCENTUAL_HE_DIURNA: TFMTBCDField;
    CDSPontoParametroPERCENTUAL_HE_NOTURNA: TFMTBCDField;
    CDSPontoParametroDURACAO_HORA_NOTURNA: TStringField;
    CDSPontoParametroTRATAMENTO_HORA_MAIS: TStringField;
    CDSPontoParametroTRATAMENTO_HORA_MENOS: TStringField;
    PageControl1: TPageControl;
    TabSheetMarcacao: TTabSheet;
    GridMarcacao: TJvDBUltimGrid;
    TabSheetFechamento: TTabSheet;
    CDSPontoFechamentoJornada: TClientDataSet;
    CDSPontoFechamentoJornadaID: TIntegerField;
    CDSPontoFechamentoJornadaID_PONTO_CLASSIFICACAO_JORNADA: TIntegerField;
    CDSPontoFechamentoJornadaID_COLABORADOR: TIntegerField;
    CDSPontoFechamentoJornadaDATA_FECHAMENTO: TDateField;
    CDSPontoFechamentoJornadaDIA_SEMANA: TStringField;
    CDSPontoFechamentoJornadaCODIGO_HORARIO: TStringField;
    CDSPontoFechamentoJornadaCARGA_HORARIA_DIURNA: TStringField;
    CDSPontoFechamentoJornadaENTRADA01: TStringField;
    CDSPontoFechamentoJornadaSAIDA01: TStringField;
    CDSPontoFechamentoJornadaENTRADA02: TStringField;
    CDSPontoFechamentoJornadaSAIDA02: TStringField;
    CDSPontoFechamentoJornadaENTRADA03: TStringField;
    CDSPontoFechamentoJornadaSAIDA03: TStringField;
    CDSPontoFechamentoJornadaENTRADA04: TStringField;
    CDSPontoFechamentoJornadaSAIDA04: TStringField;
    CDSPontoFechamentoJornadaENTRADA05: TStringField;
    CDSPontoFechamentoJornadaSAIDA05: TStringField;
    CDSPontoFechamentoJornadaHORA_INICIO_JORNADA: TStringField;
    CDSPontoFechamentoJornadaHORA_FIM_JORNADA: TStringField;
    CDSPontoFechamentoJornadaHORA_EXTRA01: TStringField;
    CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA01: TFMTBCDField;
    CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA01: TStringField;
    CDSPontoFechamentoJornadaHORA_EXTRA02: TStringField;
    CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA02: TFMTBCDField;
    CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA02: TStringField;
    CDSPontoFechamentoJornadaHORA_EXTRA03: TStringField;
    CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA03: TFMTBCDField;
    CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA03: TStringField;
    CDSPontoFechamentoJornadaHORA_EXTRA04: TStringField;
    CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA04: TFMTBCDField;
    CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA04: TStringField;
    GridFechamento: TJvDBUltimGrid;
    DSPontoFechamentoJornada: TDataSource;
    CDSPontoFechamentoJornadaNOME_COLABORADOR: TStringField;
    CDSPontoFechamentoJornadaCARGA_HORARIA_NOTURNA: TStringField;
    ActionProcessarFechamento: TAction;
    CDSPontoClassificacao: TClientDataSet;
    CDSPontoClassificacaoID: TIntegerField;
    CDSPontoClassificacaoID_EMPRESA: TIntegerField;
    CDSPontoClassificacaoCODIGO: TStringField;
    CDSPontoClassificacaoNOME: TStringField;
    CDSPontoClassificacaoDESCRICAO: TStringField;
    CDSPontoClassificacaoPADRAO: TStringField;
    CDSRegistro3CODIGO_HORARIO: TStringField;
    CDSRegistro3HORA_INICIO_JORNADA: TStringField;
    CDSRegistro3HORA_FIM_JORNADA: TStringField;
    CDSPontoFechamentoJornadaCOMPENSAR: TStringField;
    CDSPontoFechamentoJornadaBANCO_HORAS: TStringField;
    CDSPontoFechamentoJornadaOBSERVACAO: TStringField;
    CDSPontoFechamentoJornadaSITUACAO: TStringField;
    CDSPontoFechamentoJornadaCARGA_HORARIA_TOTAL: TStringField;
    CDSRegistro3CARGA_HORARIA: TStringField;
    CDSPontoFechamentoJornadaCARGA_HORARIA_ESPERADA: TStringField;
    CDSPontoFechamentoJornadaFALTA_ATRASO: TStringField;
    procedure ActionSalvarExecute(Sender: TObject);
    procedure ActionImportarArquivoExecute(Sender: TObject);
    procedure ActionSairExecute(Sender: TObject);
    procedure CDSRegistro3AfterPost(DataSet: TDataSet);
    procedure ActionValidarDadosExecute(Sender: TObject);
    procedure DesconsiderarMarcao1Click(Sender: TObject);
    procedure GridMarcacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RemoverRegistroIncludo1Click(Sender: TObject);
    procedure ActionProcessarFechamentoExecute(Sender: TObject);
  private
    { Private declarations }
    function ValidarDadosInformados: Boolean;
    procedure VerificarDadosNaBase;
  public
    { Public declarations }
  end;

var
  FPontoTratamentoArquivoAFD: TFPontoTratamentoArquivoAFD;

implementation

uses
  UMenu, ULookup, UDataModule, PontoMarcacaoVO, PontoMarcacaoController, ViewPessoaColaboradorVO,
  ViewPessoaColaboradorController,  UPontoRegistroIncluidoAFD, PontoRelogioController,
  ViewPontoEscalaTurmaController, PontoHorarioController, PontoClassificacaoJornadaController,
  PontoParametroController, PontoFechamentoJornadaVO;
{$R *.dfm}


{$REGION 'Infra'}
procedure TFPontoTratamentoArquivoAFD.ActionSairExecute(Sender: TObject);
begin
  FechaFormulario;
end;
{$ENDREGION}

{$REGION 'Controles CRUD'}
procedure TFPontoTratamentoArquivoAFD.ActionSalvarExecute(Sender: TObject);
var
  PontoMarcacaoComLista: TPontoMarcacaoVO;
  PontoMarcacao: TPontoMarcacaoVO;
  PontoFechamentoJornada: TPontoFechamentoJornadaVO;
begin
  if Application.MessageBox('Deseja salvar as informa��es no banco de dados?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    try
      CDSRegistro3.DisableControls;
      CDSPontoFechamentoJornada.DisableControls;

      // Verifica se existem registros para serem persistidos
      CDSRegistro3.Filtered := False;
      CDSRegistro3.Filter := 'SITUACAO_REGISTRO = ' + QuotedStr('N�o Armazenado');
      CDSRegistro3.Filtered := True;
      if CDSRegistro3.RecordCount = 0 then
      begin
        Application.MessageBox('N�o existem registros para serem armazenados na base de dados.', 'Informa��o do Sistema', MB_OK + MB_IconInformation);
        Exit;
      end;

      // Verifica existem registros pendentes nas marca��es
      CDSRegistro3.Filtered := False;
      CDSRegistro3.Filter := 'SITUACAO_REGISTRO = ' + QuotedStr('Pendente');
      CDSRegistro3.Filtered := True;
      if CDSRegistro3.RecordCount > 0 then
      begin
        Application.MessageBox('Existem pend�ncias nas marca��es. Dados n�o podem ser persistidos.', 'Informa��o do Sistema', MB_OK + MB_IconInformation);
        Exit;
      end;

      ActionProcessarFechamento.Execute;

      // Verifica existem registros pendentes no fechamento
      CDSPontoFechamentoJornada.Filtered := False;
      CDSPontoFechamentoJornada.Filter := 'SITUACAO = ' + QuotedStr('Pendente');
      CDSPontoFechamentoJornada.Filtered := True;
      if CDSPontoFechamentoJornada.RecordCount > 0 then
      begin
        Application.MessageBox('Existem pend�ncias no fechamento. Dados n�o podem ser persistidos.', 'Informa��o do Sistema', MB_OK + MB_IconInformation);
        Exit;
      end;

      if ValidarDadosInformados then
      begin
        CDSRegistro3.Filtered := False;
        CDSPontoFechamentoJornada.Filtered := False;

        // Marca��es
        PontoMarcacaoComLista := TPontoMarcacaoVO.Create;
        CDSRegistro3.First;
        while not CDSRegistro3.eof do
        begin
          PontoMarcacao := TPontoMarcacaoVO.Create;
          PontoMarcacao.IdColaborador := CDSRegistro3ID_COLABORADOR.AsInteger;
          PontoMarcacao.IdPontoRelogio := CDSRegistro3ID_PONTO_RELOGIO.AsInteger;
          if CDSRegistro3Nsr.AsString <> 'Incluido' then
            PontoMarcacao.Nsr := CDSRegistro3Nsr.AsInteger;
          PontoMarcacao.DataMarcacao := StrToDate(FormatMaskText('##/##/####;0;_', CDSRegistro3DataMarcacao.AsString));
          PontoMarcacao.HoraMarcacao := FormatMaskText('##:##;0;_', CDSRegistro3HoraMarcacao.AsString) + ':00';
          PontoMarcacao.TipoMarcacao := Copy(CDSRegistro3TIPO_MARCACAO.AsString, 1, 1);
          PontoMarcacao.TipoRegistro := Copy(CDSRegistro3TIPO_REGISTRO.AsString, 1, 1);
          PontoMarcacao.Justificativa := CDSRegistro3JUSTIFICATIVA.AsString;
          PontoMarcacao.ParEntradaSaida := CDSRegistro3PAR_ENTRADA_SAIDA.AsString;
          PontoMarcacaoComLista.ListaPontoMarcacao.Add(PontoMarcacao);
          CDSRegistro3.Next;
        end;
        CDSRegistro3.First;

        // Fechamento
        CDSPontoFechamentoJornada.First;
        while not CDSPontoFechamentoJornada.eof do
        begin
          PontoFechamentoJornada := TPontoFechamentoJornadaVO.Create;
          PontoFechamentoJornada.IdPontoClassificacaoJornada := CDSPontoFechamentoJornadaID_PONTO_CLASSIFICACAO_JORNADA.AsInteger;
          PontoFechamentoJornada.IdColaborador := CDSPontoFechamentoJornadaID_COLABORADOR.AsInteger;
          PontoFechamentoJornada.DataFechamento := CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsDateTime;
          PontoFechamentoJornada.DiaSemana := CDSPontoFechamentoJornadaDIA_SEMANA.AsString;
          PontoFechamentoJornada.CodigoHorario := CDSPontoFechamentoJornadaCODIGO_HORARIO.AsString;
          PontoFechamentoJornada.CargaHorariaEsperada := CDSPontoFechamentoJornadaCARGA_HORARIA_ESPERADA.AsString;
          PontoFechamentoJornada.CargaHorariaDiurna := CDSPontoFechamentoJornadaCARGA_HORARIA_DIURNA.AsString;
          PontoFechamentoJornada.CargaHorariaNoturna := CDSPontoFechamentoJornadaCARGA_HORARIA_NOTURNA.AsString;
          PontoFechamentoJornada.CargaHorariaTotal := CDSPontoFechamentoJornadaCARGA_HORARIA_TOTAL.AsString;
          PontoFechamentoJornada.Entrada01 := CDSPontoFechamentoJornadaENTRADA01.AsString;
          PontoFechamentoJornada.Entrada02 := CDSPontoFechamentoJornadaENTRADA02.AsString;
          PontoFechamentoJornada.Entrada03 := CDSPontoFechamentoJornadaENTRADA03.AsString;
          PontoFechamentoJornada.Entrada04 := CDSPontoFechamentoJornadaENTRADA04.AsString;
          PontoFechamentoJornada.Entrada05 := CDSPontoFechamentoJornadaENTRADA05.AsString;
          PontoFechamentoJornada.Saida01 := CDSPontoFechamentoJornadaSAIDA01.AsString;
          PontoFechamentoJornada.Saida02 := CDSPontoFechamentoJornadaSAIDA02.AsString;
          PontoFechamentoJornada.Saida03 := CDSPontoFechamentoJornadaSAIDA03.AsString;
          PontoFechamentoJornada.Saida04 := CDSPontoFechamentoJornadaSAIDA04.AsString;
          PontoFechamentoJornada.Saida05 := CDSPontoFechamentoJornadaSAIDA05.AsString;
          PontoFechamentoJornada.HoraInicioJornada := CDSPontoFechamentoJornadaHORA_INICIO_JORNADA.AsString;
          PontoFechamentoJornada.HoraFimJornada := CDSPontoFechamentoJornadaHORA_FIM_JORNADA.AsString;
          PontoFechamentoJornada.HoraExtra01 := CDSPontoFechamentoJornadaHORA_EXTRA01.AsString;
          PontoFechamentoJornada.HoraExtra02 := CDSPontoFechamentoJornadaHORA_EXTRA02.AsString;
          PontoFechamentoJornada.HoraExtra03 := CDSPontoFechamentoJornadaHORA_EXTRA03.AsString;
          PontoFechamentoJornada.HoraExtra04 := CDSPontoFechamentoJornadaHORA_EXTRA04.AsString;
          PontoFechamentoJornada.PercentualHoraExtra01 := CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA01.AsExtended;
          PontoFechamentoJornada.PercentualHoraExtra02 := CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA02.AsExtended;
          PontoFechamentoJornada.PercentualHoraExtra03 := CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA03.AsExtended;
          PontoFechamentoJornada.PercentualHoraExtra04 := CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA04.AsExtended;
          PontoFechamentoJornada.ModalidadeHoraExtra01 := CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA01.AsString;
          PontoFechamentoJornada.ModalidadeHoraExtra02 := CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA02.AsString;
          PontoFechamentoJornada.ModalidadeHoraExtra03 := CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA03.AsString;
          PontoFechamentoJornada.ModalidadeHoraExtra04 := CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA04.AsString;
          PontoFechamentoJornada.FaltaAtraso := CDSPontoFechamentoJornadaFALTA_ATRASO.AsString;
          PontoFechamentoJornada.Compensar := CDSPontoFechamentoJornadaCOMPENSAR.AsString;
          PontoFechamentoJornada.BancoHoras := CDSPontoFechamentoJornadaBANCO_HORAS.AsString;
          PontoFechamentoJornada.Observacao := CDSPontoFechamentoJornadaOBSERVACAO.AsString;
          PontoMarcacaoComLista.ListaPontoFechamentoJornada.Add(PontoFechamentoJornada);
          CDSPontoFechamentoJornada.Next;
        end;
        CDSPontoFechamentoJornada.First;
        //
        TController.ExecutarMetodo('PontoMarcacaoController.TPontoMarcacaoController', 'InsereLista', [PontoMarcacaoComLista], 'PUT', 'Lista');
        VerificarDadosNaBase;
        ActionValidarDados.Execute;
      end;
    finally
      CDSRegistro3.Filtered := False;
      CDSPontoFechamentoJornada.Filtered := False;
      CDSRegistro3.EnableControls;
      CDSPontoFechamentoJornada.EnableControls;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Grid'}
procedure TFPontoTratamentoArquivoAFD.GridMarcacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    try
      Application.CreateForm(TFLookup, FLookup);
      ULookup.FLookup.ObjetoVO := TViewPessoaColaboradorVO.Create;
      ULookup.FLookup.ObjetoController := TViewPessoaColaboradorController.Create;
      FLookup.ShowModal;
      if FLookup.CDSLookup.RecordCount > 0 then
      begin
        CDSRegistro3.Append;
        CDSRegistro3Nsr.AsString := 'Incluido';
        CDSRegistro3SITUACAO_REGISTRO.AsString := 'N�o Armazenado';
        CDSRegistro3TIPO_REGISTRO.AsString := 'Incluido';
        CDSRegistro3NumeroPis.AsString := FLookup.CDSLookup.FieldByName('PIS_NUMERO').AsString;
        CDSRegistro3NOME_COLABORADOR.AsString := FLookup.CDSLookup.FieldByName('NOME').AsString;
        CDSRegistro3CODIGO_TURMA_PONTO.AsString := FLookup.CDSLookup.FieldByName('CODIGO_TURMA_PONTO').AsString;
        CDSRegistro3ID_COLABORADOR.AsInteger := FLookup.CDSLookup.FieldByName('ID').AsInteger;
        CDSRegistro3NumeroSerieRep.AsString := FMenu.ACBrPonto.Ponto_AFD.Cabecalho.Campo07;

        // Pega o ID do Rel�gio de Ponto
        TPontoRelogioController.SetDataSet(CDSPontoRelogio);
        TController.ExecutarMetodo('PontoRelogioController.TPontoRelogioController', 'Consulta', ['NUMERO_SERIE = ' + QuotedStr(FMenu.ACBrPonto.Ponto_AFD.Cabecalho.Campo07), '0', False], 'GET', 'Lista');
        if CDSPontoRelogio.RecordCount > 0 then
          CDSRegistro3ID_PONTO_RELOGIO.AsInteger := CDSPontoRelogioID.AsInteger;

        CDSRegistro3.Post;
        //
        Application.CreateForm(TFPontoRegistroIncluidoAFD, FPontoRegistroIncluidoAFD);
        FPontoRegistroIncluidoAFD.ShowModal;
      end;
    finally
    end;
  end;
end;

procedure TFPontoTratamentoArquivoAFD.CDSRegistro3AfterPost(DataSet: TDataSet);
begin
  if CDSRegistro3Nsr.AsString = '' then
    CDSRegistro3.Delete;
end;
{$ENDREGION}

{$REGION 'Controle de Popup'}
procedure TFPontoTratamentoArquivoAFD.DesconsiderarMarcao1Click(Sender: TObject);
begin
  if not CDSRegistro3.IsEmpty then
  begin
    if CDSRegistro3SITUACAO_REGISTRO.AsString = 'Pendente' then
      Application.MessageBox('Registros pendentes n�o ser�o armazenados.', 'Informa��o do Sistema', MB_OK + MB_IconInformation)
    else
    begin
      if Application.MessageBox('Deseja realmente desconsiderar o registro?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
      begin
        CDSRegistro3.Edit;
        CDSRegistro3TIPO_MARCACAO.AsString := 'Desconsiderar';
        CDSRegistro3.Post;
      end;
    end;
  end;
end;

procedure TFPontoTratamentoArquivoAFD.RemoverRegistroIncludo1Click(Sender: TObject);
begin
  if not CDSRegistro3.IsEmpty then
  begin
    if CDSRegistro3Nsr.AsString <> 'Incluido' then
      Application.MessageBox('Apenas registros inclu�dos manualmente podem ser removidos.', 'Informa��o do Sistema', MB_OK + MB_IconInformation)
    else
    begin
      if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
        CDSRegistro3.Delete;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFPontoTratamentoArquivoAFD.ActionImportarArquivoExecute(Sender: TObject);
var
  i: Integer;
begin
  if FDataModule.OpenDialog.Execute then
  begin
    CDSRegistro3.DisableControls;
    CDSRegistro3.EmptyDataSet;

    FMenu.ACBrPonto.Ponto_AFD := FMenu.ACBrPonto.ProcessarArquivo_AFD(FDataModule.OpenDialog.FileName);

    // primeiro grava os dados que est�o no arquivo AFD
    for i := 0 to FMenu.ACBrPonto.Ponto_AFD.Registro3.Count - 1 do
    begin
      CDSRegistro3.Append;
      CDSRegistro3Nsr.AsString := FMenu.ACBrPonto.Ponto_AFD.Registro3.Items[i].Campo01;
      CDSRegistro3TipoRegistro.AsString := FMenu.ACBrPonto.Ponto_AFD.Registro3.Items[i].Campo02;
      CDSRegistro3DataMarcacao.AsString := FMenu.ACBrPonto.Ponto_AFD.Registro3.Items[i].Campo03;
      CDSRegistro3HoraMarcacao.AsString := FMenu.ACBrPonto.Ponto_AFD.Registro3.Items[i].Campo04;
      CDSRegistro3NumeroPis.AsString := FMenu.ACBrPonto.Ponto_AFD.Registro3.Items[i].Campo05;
      CDSRegistro3NumeroSerieRep.AsString := FMenu.ACBrPonto.Ponto_AFD.Cabecalho.Campo07;
      CDSRegistro3.Post;
    end;
    CDSRegistro3.EnableControls;
  end;

  // Ordena os registros por: PIS, Data e Hora
  CDSRegistro3.IndexFieldNames := 'NumeroPis; DataMarcacao; HoraMarcacao';

  // Verifica se os dados j� est�o no banco de dados
  VerificarDadosNaBase;

  // Valida os dados apresentados na Grid
  ActionValidarDados.Execute;

  GridMarcacao.SetFocus;
end;

procedure TFPontoTratamentoArquivoAFD.VerificarDadosNaBase;
var
  Filtro: String;
begin
  CDSRegistro3.DisableControls;
  CDSRegistro3.First;
  while not CDSRegistro3.eof do
  begin
    // Pega o nome do colaborador
    TViewPessoaColaboradorController.SetDataSet(CDSColaboradorPis);
    /// EXERCICIO: O que existe de errado na consulta abaixo? Corrija.
    TController.ExecutarMetodo('ViewPessoaColaboradorController.TViewPessoaColaboradorController', 'Consulta', ['PIS_NUMERO = ' + QuotedStr(CDSRegistro3NumeroPis.AsString), '0', False], 'GET', 'Lista');

    CDSRegistro3.Edit;
    if CDSColaboradorPis.RecordCount > 0 then
    begin
      if CDSColaboradorPisCODIGO_TURMA_PONTO.AsString = '' then
      begin
        CDSRegistro3NOME_COLABORADOR.AsString := 'Colaborador est� sem o c�digo da turma cadastrada';
        CDSRegistro3SITUACAO_REGISTRO.AsString := 'Pendente';
      end
      else
      begin
        // Pega os dados do rel�gio de ponto
        TPontoRelogioController.SetDataSet(CDSPontoRelogio);
        TController.ExecutarMetodo('PontoRelogioController.TPontoRelogioController', 'Consulta', ['NUMERO_SERIE = ' + QuotedStr(CDSRegistro3NumeroSerieRep.AsString), '0', False], 'GET', 'Lista');

        if CDSPontoRelogio.RecordCount > 0 then
        begin
          CDSRegistro3ID_PONTO_RELOGIO.AsInteger := CDSPontoRelogioID.AsInteger;
          CDSRegistro3ID_COLABORADOR.AsInteger := CDSColaboradorPisID.AsInteger;
          CDSRegistro3NOME_COLABORADOR.AsString := CDSColaboradorPisNOME.AsString;
          CDSRegistro3CODIGO_TURMA_PONTO.AsString := CDSColaboradorPisCODIGO_TURMA_PONTO.AsString;

          // Verifica se o registro j� foi armazenado no banco de dados
          TPontoMarcacaoController.SetDataSet(CDSPontoMarcacao);
          Filtro := 'NSR = ' + QuotedStr(CDSRegistro3Nsr.AsString) + ' and ID_PONTO_RELOGIO = ' + QuotedStr(CDSPontoRelogioID.AsString);
          TController.ExecutarMetodo('PontoMarcacaoController.TPontoMarcacaoController', 'Consulta', [Filtro, '0', False], 'GET', 'Lista');

          if CDSPontoMarcacao.RecordCount > 0 then
          begin
            CDSRegistro3SITUACAO_REGISTRO.AsString := 'J� Armazenado';
            CDSRegistro3TIPO_MARCACAO.AsString := CDSPontoMarcacaoTIPO_MARCACAO.AsString;
            CDSRegistro3TIPO_REGISTRO.AsString := CDSPontoMarcacaoTIPO_REGISTRO.AsString;
            CDSRegistro3JUSTIFICATIVA.AsString := CDSPontoMarcacaoJUSTIFICATIVA.AsString;
            CDSRegistro3PAR_ENTRADA_SAIDA.AsString := CDSPontoMarcacaoPAR_ENTRADA_SAIDA.AsString;
          end
          else
          begin
            if CDSRegistro3Nsr.AsString = 'Incluido' then
              CDSRegistro3SITUACAO_REGISTRO.AsString := 'J� Armazenado'
            else
              CDSRegistro3SITUACAO_REGISTRO.AsString := 'N�o Armazenado';
          end;
        end
        else
        begin
          CDSRegistro3NOME_COLABORADOR.AsString := 'N�mero de s�rie do REP n�o encontrado na base de dados';
          CDSRegistro3SITUACAO_REGISTRO.AsString := 'Pendente';
        end;
      end;
    end
    else
    begin
      CDSRegistro3NOME_COLABORADOR.AsString := 'N�mero do PIS n�o encontrado na base de dados';
      CDSRegistro3SITUACAO_REGISTRO.AsString := 'Pendente';
    end;
    CDSRegistro3.Post;
    CDSRegistro3.Next;
  end;
  CDSRegistro3.First;
  CDSRegistro3.EnableControls;
end;

procedure TFPontoTratamentoArquivoAFD.ActionValidarDadosExecute(Sender: TObject);
var
  i, SegundosHoraMarcada, SegundosHoraHorario, DiferencaSegundosAnterior, DiferencaSegundos: Integer;
  Filtro, CampoAtual, CampoSelecionado: String;
begin
  if CDSRegistro3.IsEmpty then
    Application.MessageBox('N�o existem dados para valida��o.', 'Informa��o do Sistema', MB_OK + MB_IconInformation)
  else
  begin
    CDSRegistro3.DisableControls;
    CDSRegistro3.First;
    while not CDSRegistro3.eof do
    begin
      if CDSRegistro3SITUACAO_REGISTRO.AsString = 'J� Armazenado' then
      begin
        CDSRegistro3.Edit;
        case AnsiIndexStr(CDSRegistro3TIPO_MARCACAO.AsString, ['E', 'S', 'D']) of
          0:
            CDSRegistro3TIPO_MARCACAO.AsString := 'Entrada';
          1:
            CDSRegistro3TIPO_MARCACAO.AsString := 'Saida';
          2:
            CDSRegistro3TIPO_MARCACAO.AsString := 'Desconsiderar';
        end;
        //
        case AnsiIndexStr(CDSRegistro3TIPO_REGISTRO.AsString, ['O', 'I', 'P']) of
          0:
            CDSRegistro3TIPO_REGISTRO.AsString := 'Original';
          1:
            CDSRegistro3TIPO_REGISTRO.AsString := 'Incluido';
          2:
            CDSRegistro3TIPO_REGISTRO.AsString := 'Pre-Assinalado';
        end;
        CDSRegistro3.Post;
      end
      else
      begin
        if (CDSRegistro3SITUACAO_REGISTRO.AsString <> 'Pendente') and (CDSRegistro3TIPO_MARCACAO.AsString <> 'Desconsiderar') then
        begin

          // Pega os dados da escala e turma do colaborador selecionado
          TViewPontoEscalaTurmaController.SetDataSet(CDSPontoEscalaTurma);
          Filtro := 'CODIGO_TURMA = ' + QuotedStr(CDSRegistro3CODIGO_TURMA_PONTO.AsString);
          TController.ExecutarMetodo('ViewPontoEscalaTurmaController.TViewPontoEscalaTurmaController', 'Consulta', [Filtro, '0', False], 'GET', 'Lista');

          // Pega os dados do hor�rio do dia selecionado
          TPontoHorarioController.SetDataSet(CDSPontoHorario);
          case DayOfWeek(StrToDate(FormatMaskText('##/##/####;0;_', CDSRegistro3DataMarcacao.AsString))) of
            1:
              TController.ExecutarMetodo('PontoHorarioController.TPontoHorarioController', 'Consulta', ['CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_DOMINGO.AsString), '0', False], 'GET', 'Lista');
            2:
              TController.ExecutarMetodo('PontoHorarioController.TPontoHorarioController', 'Consulta', ['CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_SEGUNDA.AsString), '0', False], 'GET', 'Lista');
            3:
              TController.ExecutarMetodo('PontoHorarioController.TPontoHorarioController', 'Consulta', ['CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_TERCA.AsString), '0', False], 'GET', 'Lista');
            4:
              TController.ExecutarMetodo('PontoHorarioController.TPontoHorarioController', 'Consulta', ['CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_QUARTA.AsString), '0', False], 'GET', 'Lista');
            5:
              TController.ExecutarMetodo('PontoHorarioController.TPontoHorarioController', 'Consulta', ['CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_QUINTA.AsString), '0', False], 'GET', 'Lista');
            6:
              TController.ExecutarMetodo('PontoHorarioController.TPontoHorarioController', 'Consulta', ['CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_SEXTA.AsString), '0', False], 'GET', 'Lista');
            7:
              TController.ExecutarMetodo('PontoHorarioController.TPontoHorarioController', 'Consulta', ['CODIGO = ' + QuotedStr(CDSPontoEscalaTurmaCODIGO_HORARIO_SABADO.AsString), '0', False], 'GET', 'Lista');
          end;

          if CDSPontoHorario.RecordCount = 0 then
          begin
            CDSRegistro3.Edit;
            CDSRegistro3NOME_COLABORADOR.AsString := 'C�digo do hor�rio cadastrado na escala n�o corresponde a um hor�rio armazenado';
            CDSRegistro3SITUACAO_REGISTRO.AsString := 'Pendente';
            CDSRegistro3.Post;
          end
          else
          begin
            if CDSRegistro3TIPO_REGISTRO.AsString <> 'Incluido' then
            begin
              // Compara o hor�rio marcado no arquivo com cada hor�rio armazenado na base. O hor�rio ser� alocado naquele que tiver menor diferen�a em segundos
              DiferencaSegundosAnterior := 0; // Guarda a diferen�a em segundos da compara�ao feita anteriormente entre o hor�rio marcado e o hor�rio da escala que est� na base
              for i := 0 to CDSPontoHorario.FieldList.Count - 1 do
              begin
                if (Copy(CDSPontoHorario.FieldList.Fields[i].FieldName, 1, 5) = 'ENTRA') or (Copy(CDSPontoHorario.FieldList.Fields[i].FieldName, 1, 5) = 'SAIDA') then
                begin
                  CampoAtual := CDSPontoHorario.FieldList.Fields[i].FieldName;

                  if Length(Trim(CDSPontoHorario.FieldByName(CampoAtual).AsString)) = 8 then
                  begin
                    SegundosHoraMarcada := Hora_Seg(FormatMaskText('##:##;0;_', CDSRegistro3HoraMarcacao.AsString) + ':00');
                    SegundosHoraHorario := Hora_Seg(CDSPontoHorario.FieldByName(CampoAtual).AsString);
                    DiferencaSegundos := Abs(SegundosHoraMarcada - SegundosHoraHorario);
                    if DiferencaSegundosAnterior = 0 then
                      DiferencaSegundosAnterior := DiferencaSegundos;

                    // Caso a diferen�a de segundos atual seja menor, guarda o campo atual
                    if DiferencaSegundos <= DiferencaSegundosAnterior then
                    begin
                      DiferencaSegundosAnterior := DiferencaSegundos;
                      CampoSelecionado := CampoAtual;
                    end;
                  end;
                end;
              end;
            end;

            CDSRegistro3.Edit;
            CDSRegistro3CARGA_HORARIA.AsString := CDSPontoHorarioCARGA_HORARIA.AsString;
            CDSRegistro3CODIGO_HORARIO.AsString := CDSPontoHorarioCODIGO.AsString;
            CDSRegistro3HORA_INICIO_JORNADA.AsString := CDSPontoHorarioHORA_INICIO_JORNADA.AsString;
            CDSRegistro3HORA_FIM_JORNADA.AsString := CDSPontoHorarioHORA_FIM_JORNADA.AsString;
            if CDSRegistro3TIPO_REGISTRO.AsString <> 'Incluido' then
            begin
              CDSRegistro3TIPO_MARCACAO.AsString := IfThen(Copy(CampoSelecionado, 1, 1) = 'E', 'Entrada', 'Saida');
              CDSRegistro3PAR_ENTRADA_SAIDA.AsString := Copy(CampoSelecionado, 1, 1) + Copy(CampoSelecionado, Length(CampoSelecionado), 1);
            end;
            if CDSRegistro3TIPO_REGISTRO.AsString = '' then
              CDSRegistro3TIPO_REGISTRO.AsString := 'Original';
            CDSRegistro3.Post;
          end;
        end;
      end;
      CDSRegistro3.Next;
    end;
    CDSRegistro3.First;
    CDSRegistro3.EnableControls;
  end;
end;

procedure TFPontoTratamentoArquivoAFD.ActionProcessarFechamentoExecute(Sender: TObject);
var
  Filtro, CampoAtual, CampoAnteriorEntrada, CampoAnteriorSaida, Pis, DataSelecionada: String;
  i, SegundosEntradasDia, SegundosSaidasDia, SegundosNoite, HoraNoturnaInicio, SegundosDiferenca: Integer;
  TemBuraco: Boolean;
begin
  try
    CDSRegistro3.DisableControls;

    // Verifica existem registros pendentes nas marca��es
    CDSRegistro3.Filtered := False;
    CDSRegistro3.Filter := 'SITUACAO_REGISTRO = ' + QuotedStr('Pendente');
    CDSRegistro3.Filtered := True;
    if CDSRegistro3.RecordCount > 0 then
    begin
      Application.MessageBox('Existem pend�ncias nas marca��es.', 'Informa��o do Sistema', MB_OK + MB_IconInformation);
      Exit;
    end;

    // Controla se existe uma lacuna entre o par entrada/saida
    TemBuraco := False;

    // Pega o tipo de classifica��o de jornada padr�o para a empresa corrente
    TPontoClassificacaoJornadaController.SetDataSet(CDSPontoClassificacao);
    Filtro := 'ID_EMPRESA = ' + QuotedStr(IntToStr(Sessao.Empresa.Id)) + ' and PADRAO = ' + QuotedStr('S');
    TController.ExecutarMetodo('PontoClassificacaoJornadaController.TPontoClassificacaoJornadaController', 'Consulta', [Filtro, '0', False], 'GET', 'Lista');

    CDSPontoFechamentoJornada.DisableControls;
    CDSPontoFechamentoJornada.EmptyDataSet;
    CDSRegistro3.Filtered := False;
    CDSRegistro3.Filter := 'TIPO_MARCACAO <> ' + QuotedStr('Desconsiderar');
    CDSRegistro3.Filtered := True;

    // Ordena os registros por: PIS, Data e Par Entrada/Saida
    CDSRegistro3.IndexFieldNames := 'NumeroPis; DataMarcacao; PAR_ENTRADA_SAIDA';

    CDSRegistro3.First;
    while not CDSRegistro3.eof do
    begin
      if (CDSRegistro3NumeroPis.AsString <> Pis) or (CDSRegistro3DataMarcacao.AsString <> DataSelecionada) then
      begin
        Pis := CDSRegistro3NumeroPis.AsString;
        DataSelecionada := CDSRegistro3DataMarcacao.AsString;

        CDSPontoFechamentoJornada.Append;
        CDSPontoFechamentoJornadaID_PONTO_CLASSIFICACAO_JORNADA.AsInteger := CDSPontoClassificacaoID.AsInteger;
        CDSPontoFechamentoJornadaID_COLABORADOR.AsInteger := CDSRegistro3ID_COLABORADOR.AsInteger;
        CDSPontoFechamentoJornadaNOME_COLABORADOR.AsString := CDSRegistro3NOME_COLABORADOR.AsString;
        CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsDateTime := StrToDate(FormatMaskText('##/##/####;0;_', CDSRegistro3DataMarcacao.AsString));
        case DayOfWeek(StrToDate(FormatMaskText('##/##/####;0;_', CDSRegistro3DataMarcacao.AsString))) of
          1:
            CDSPontoFechamentoJornadaDIA_SEMANA.AsString := 'DOMINGO';
          2:
            CDSPontoFechamentoJornadaDIA_SEMANA.AsString := 'SEGUNDA';
          3:
            CDSPontoFechamentoJornadaDIA_SEMANA.AsString := 'TERCA';
          4:
            CDSPontoFechamentoJornadaDIA_SEMANA.AsString := 'QUARTA';
          5:
            CDSPontoFechamentoJornadaDIA_SEMANA.AsString := 'QUINTA';
          6:
            CDSPontoFechamentoJornadaDIA_SEMANA.AsString := 'SEXTA';
          7:
            CDSPontoFechamentoJornadaDIA_SEMANA.AsString := 'SABADO';
        end;
        CDSPontoFechamentoJornadaCODIGO_HORARIO.AsString := CDSRegistro3CODIGO_HORARIO.AsString;
        CDSPontoFechamentoJornadaCARGA_HORARIA_ESPERADA.AsString := CDSRegistro3CARGA_HORARIA.AsString;
        CDSPontoFechamentoJornadaENTRADA01.AsString := FormatMaskText('##:##;0;_', CDSRegistro3HoraMarcacao.AsString) + ':00';
        CDSPontoFechamentoJornadaHORA_INICIO_JORNADA.AsString := CDSRegistro3HORA_INICIO_JORNADA.AsString;
        CDSPontoFechamentoJornadaHORA_FIM_JORNADA.AsString := CDSRegistro3HORA_FIM_JORNADA.AsString;
      end
      else
      begin
        CDSPontoFechamentoJornada.Edit;
        if Copy(CDSRegistro3PAR_ENTRADA_SAIDA.AsString, 1, 1) = 'E' then
          CDSPontoFechamentoJornada.FieldByName('ENTRADA0' + Copy(CDSRegistro3PAR_ENTRADA_SAIDA.AsString, 2, 1)).AsString := FormatMaskText('##:##;0;_', CDSRegistro3HoraMarcacao.AsString) + ':00'
        else
          CDSPontoFechamentoJornada.FieldByName('SAIDA0' + Copy(CDSRegistro3PAR_ENTRADA_SAIDA.AsString, 2, 1)).AsString := FormatMaskText('##:##;0;_', CDSRegistro3HoraMarcacao.AsString) + ':00'
      end;

      CDSPontoFechamentoJornada.Post;
      CDSRegistro3.Next;
    end;

    // Realiza os c�lculos necess�rios
    CDSPontoFechamentoJornada.First;
    while not CDSPontoFechamentoJornada.eof do
    begin
      // Pega os par�metros do m�s da data do fechamento
      TPontoParametroController.SetDataSet(CDSPontoParametro);
      TController.ExecutarMetodo('PontoParametroController.TPontoParametroController', 'Consulta', ['MES_ANO = ' + QuotedStr(Copy(CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsString, 4, 7)), '0', False], 'GET', 'Lista');
      if CDSPontoParametro.RecordCount = 0 then
      begin
        CDSPontoFechamentoJornada.Edit;
        CDSPontoFechamentoJornadaSITUACAO.AsString := 'Pendente';
        CDSPontoFechamentoJornadaOBSERVACAO.AsString := 'N�o existe par�metro cadastrado para o m�s ' + Copy(CDSPontoFechamentoJornadaDATA_FECHAMENTO.AsString, 4, 7);
        CDSPontoFechamentoJornada.Post;
      end
      else
      begin
        HoraNoturnaInicio := Hora_Seg(CDSPontoParametroHORA_NOTURNA_INICIO.AsString);

        SegundosEntradasDia := 0;
        SegundosSaidasDia := 0;
        SegundosNoite := 0;
        for i := 0 to CDSPontoFechamentoJornada.FieldList.Count - 1 do
        begin
          if (Copy(CDSPontoFechamentoJornada.FieldList.Fields[i].FieldName, 1, 5) = 'ENTRA') or (Copy(CDSPontoFechamentoJornada.FieldList.Fields[i].FieldName, 1, 5) = 'SAIDA') then
          begin
            CampoAtual := CDSPontoFechamentoJornada.FieldList.Fields[i].FieldName;
            if Length(Trim(CDSPontoFechamentoJornada.FieldByName(CampoAtual).AsString)) = 8 then
            begin
              if Copy(CampoAtual, 1, 1) = 'E' then
              begin
                if CampoAnteriorEntrada = '' then
                  CampoAnteriorEntrada := CampoAtual;
                if StrToInt(Copy(CampoAtual, Length(CampoAtual), 1)) - StrToInt(Copy(CampoAnteriorEntrada, Length(CampoAnteriorEntrada), 1)) > 1 then
                  TemBuraco := True;
                SegundosEntradasDia := SegundosEntradasDia + Hora_Seg(CDSPontoFechamentoJornada.FieldByName(CampoAtual).AsString);
                CampoAnteriorEntrada := CampoAtual;
              end
              else
              begin
                if CampoAnteriorSaida = '' then
                  CampoAnteriorSaida := CampoAtual;
                if StrToInt(Copy(CampoAtual, Length(CampoAtual), 1)) - StrToInt(Copy(CampoAnteriorSaida, Length(CampoAnteriorSaida), 1)) > 1 then
                  TemBuraco := True;
                if Hora_Seg(CDSPontoFechamentoJornada.FieldByName(CampoAtual).AsString) > HoraNoturnaInicio then
                begin
                  SegundosNoite := Hora_Seg(CDSPontoFechamentoJornada.FieldByName(CampoAtual).AsString) - HoraNoturnaInicio;
                  SegundosSaidasDia := SegundosSaidasDia + HoraNoturnaInicio;
                end
                else
                  SegundosSaidasDia := SegundosSaidasDia + Hora_Seg(CDSPontoFechamentoJornada.FieldByName(CampoAtual).AsString);
                CampoAnteriorSaida := CampoAtual;
              end;
            end;
          end;
        end;

        if SegundosSaidasDia - SegundosEntradasDia > 0 then
        begin
          CDSPontoFechamentoJornada.Edit;
          CDSPontoFechamentoJornadaCARGA_HORARIA_DIURNA.AsString := Seg_Hora(SegundosSaidasDia - SegundosEntradasDia);
          if TemBuraco then
          begin
            CDSPontoFechamentoJornadaSITUACAO.AsString := 'Pendente';
            CDSPontoFechamentoJornadaOBSERVACAO.AsString := 'Existe uma lacuna na marca��o das entradas/sa�das';
          end
          else
            CDSPontoFechamentoJornadaSITUACAO.AsString := 'OK';
          if SegundosNoite > 0 then
            CDSPontoFechamentoJornadaCARGA_HORARIA_NOTURNA.AsString := Seg_Hora(SegundosNoite);
          CDSPontoFechamentoJornadaCARGA_HORARIA_TOTAL.AsString := Seg_Hora(SegundosSaidasDia - SegundosEntradasDia + SegundosNoite);

          // Se a jornada for maior que a esperada, grava hora extra ou banco de horas - sen�o grava como falta
          if Hora_Seg(CDSPontoFechamentoJornadaCARGA_HORARIA_TOTAL.AsString) > Hora_Seg(CDSPontoFechamentoJornadaCARGA_HORARIA_ESPERADA.AsString) then
          begin
            SegundosDiferenca := Hora_Seg(CDSPontoFechamentoJornadaCARGA_HORARIA_TOTAL.AsString) - Hora_Seg(CDSPontoFechamentoJornadaCARGA_HORARIA_ESPERADA.AsString);
            // Hora Extra ou Banco de Horas
            if CDSPontoParametroTRATAMENTO_HORA_MAIS.AsString = 'E' then
            begin
              CDSPontoFechamentoJornadaHORA_EXTRA01.AsString := Seg_Hora(SegundosDiferenca);
              if SegundosNoite > 0 then
              begin
                CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA01.AsExtended := CDSPontoParametroPERCENTUAL_HE_NOTURNA.AsExtended;
                CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA01.AsString := 'N';
              end
              else
              begin
                CDSPontoFechamentoJornadaPERCENTUAL_HORA_EXTRA01.AsExtended := CDSPontoParametroPERCENTUAL_HE_DIURNA.AsExtended;
                CDSPontoFechamentoJornadaMODALIDADE_HORA_EXTRA01.AsString := 'D';
              end;
            end
            else
            begin
              CDSPontoFechamentoJornadaCOMPENSAR.AsString := '1';
              if SegundosNoite > 0 then
                CDSPontoFechamentoJornadaBANCO_HORAS.AsString := Seg_Hora(Trunc(SegundosDiferenca * 8/7))
              else
                CDSPontoFechamentoJornadaBANCO_HORAS.AsString := Seg_Hora(SegundosDiferenca);
            end;
          end
          else if Hora_Seg(CDSPontoFechamentoJornadaCARGA_HORARIA_TOTAL.AsString) < Hora_Seg(CDSPontoFechamentoJornadaCARGA_HORARIA_ESPERADA.AsString) then
          begin
            SegundosDiferenca := Hora_Seg(CDSPontoFechamentoJornadaCARGA_HORARIA_ESPERADA.AsString) - Hora_Seg(CDSPontoFechamentoJornadaCARGA_HORARIA_TOTAL.AsString);
            // Falta ou Banco de Horas
            if CDSPontoParametroTRATAMENTO_HORA_MENOS.AsString = 'F' then
            begin
              CDSPontoFechamentoJornadaFALTA_ATRASO.AsString := Seg_Hora(SegundosDiferenca);
            end
            else
            begin
              CDSPontoFechamentoJornadaCOMPENSAR.AsString := '2';
              CDSPontoFechamentoJornadaBANCO_HORAS.AsString := Seg_Hora(SegundosDiferenca);
            end;
          end;
          CDSPontoFechamentoJornada.Post;
        end
        else
        begin
          CDSPontoFechamentoJornada.Edit;
          CDSPontoFechamentoJornadaSITUACAO.AsString := 'Pendente';
          CDSPontoFechamentoJornadaOBSERVACAO.AsString := 'Existe um problema na marca��o das entradas/sa�das';
          CDSPontoFechamentoJornada.Post;
        end;
      end;

      CDSPontoFechamentoJornada.Next;
    end;
  finally
    CDSRegistro3.Filtered := False;

    // Ordena os registros por: PIS, Data e Hora
    CDSRegistro3.IndexFieldNames := 'NumeroPis; DataMarcacao; HoraMarcacao';

    CDSRegistro3.First;
    CDSRegistro3.EnableControls;
    CDSPontoFechamentoJornada.First;
    CDSPontoFechamentoJornada.EnableControls;
  end;
end;

function TFPontoTratamentoArquivoAFD.ValidarDadosInformados: Boolean;
var
  Mensagem: String;
  Pis, DataSelecionada: String;
begin
  try
    CDSRegistro3.DisableControls;
    CDSRegistro3.First;
    while not CDSRegistro3.eof do
    begin
      if (CDSRegistro3TIPO_REGISTRO.AsString = 'Incluido') and (CDSRegistro3JUSTIFICATIVA.AsString = '') then
        Mensagem := Mensagem + #13 + 'Registros inclu�dos necessitam de justificativa. Informe a justificativa.';
      if (CDSRegistro3TIPO_REGISTRO.AsString = 'Original') and (CDSRegistro3JUSTIFICATIVA.AsString <> '') and (CDSRegistro3TIPO_MARCACAO.AsString <> 'Desconsiderar') then
        Mensagem := Mensagem + #13 + 'Registros originais n�o necessitam de justificativa. Remova a justificativa. [Sequencial = ' + CDSRegistro3Nsr.AsString + ']';
      if (CDSRegistro3TIPO_MARCACAO.AsString = 'Desconsiderar') and (CDSRegistro3JUSTIFICATIVA.AsString = '') then
        Mensagem := Mensagem + #13 + 'Registros desconsiderados necessitam de justificativa. Informe a justificativa. [Sequencial = ' + CDSRegistro3Nsr.AsString + ']';
      //
      CDSRegistro3.Next;
    end;
    CDSRegistro3.First;
    CDSRegistro3.EnableControls;
    //
    if Mensagem <> '' then
    begin
      Application.MessageBox(PChar('Ocorreram erros na valida��o dos dados informados. Lista de erros abaixo: ' + #13 + Mensagem), 'Erro do sistema', MB_OK + MB_ICONERROR);
      Result := False;
    end
    else
      Result := True;
  finally
  end;
end;
{$ENDREGION}

end.
