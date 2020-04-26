.class public Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;
.super Lcom/m4u/vivozuum/activities/ZuumActivity;
.source "MapaPontosDepositoActivity.java"

# interfaces
.implements Lcom/m4u/vivozuum/servicos/zuum/interfaces/RetornoOperacaoZuum;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$ClickMenuMaps;,
        Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$RequestPermissionCallBack;,
        Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$AcaoMascaraCEP;
    }
.end annotation


# static fields
.field private static final transient synthetic $jacocoData:[Z


# instance fields
.field private final LOG_CONSTANT:Ljava/lang/String;

.field private activity:Landroid/app/Activity;

.field private boxAberto:Z

.field private boxInfoMakers:Landroid/widget/LinearLayout;

.field private buttonPesquisarCEP:Landroid/widget/ImageButton;

.field private editTextCEP:Landroid/widget/EditText;

.field private latLongCEP:Lcom/google/android/gms/maps/model/LatLng;

.field private logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

.field private map:Lcom/google/android/gms/maps/GoogleMap;

.field private markerInfo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;",
            ">;"
        }
    .end annotation
.end field

.field private messageAllowedEver:Ljava/lang/String;

.field private minhaLocalizacao:Lcom/google/android/gms/maps/model/LatLng;

.field private pontoSelecionadoNoMapa:Lcom/google/android/gms/maps/model/Marker;

.field private pontosDepoistoVO:Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;

.field private primeiraInicializacao:Ljava/lang/Boolean;

.field private runTimePermissionManagerCourseLocation:Lcom/m4u/vivozuum/controller/RunTimePermissionManager;

.field private runTimePermissionManagerFineLocation:Lcom/m4u/vivozuum/controller/RunTimePermissionManager;

.field private searchButton:Landroid/widget/ImageButton;

.field private slideDownBoxEndereco:Landroid/view/animation/Animation;

.field private slideUpBoxEndereco:Landroid/view/animation/Animation;

.field private textViewBoxCidade:Landroid/widget/TextView;

.field private textViewBoxRua:Landroid/widget/TextView;

.field private textViewBoxTitulo:Landroid/widget/TextView;

.field private textViewTituloActionBar:Landroid/widget/TextView;

.field private title:Ljava/lang/String;


# direct methods
.method private static synthetic $jacocoInit()[Z
    .locals 4

    sget-object v0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoData:[Z

    if-nez v0, :cond_0

    const-wide v0, -0x1fd4470b53d7bb88L    # -1.858488664237019E155

    const-string v2, "com/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity"

    const/16 v3, 0x59

    invoke-static {v0, v1, v2, v3}, Lorg/jacoco/agent/rt/internal_773e439/Offline;->getProbes(JLjava/lang/String;I)[Z

    move-result-object v0

    sput-object v0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoData:[Z

    :cond_0
    return-object v0
.end method

.method public constructor <init>()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const-wide/16 v2, 0x0

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/ZuumActivity;-><init>()V

    .line 51
    const-class v1, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    .line 52
    invoke-static {}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->getInstance()Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    move-result-object v1

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    .line 55
    new-instance v1, Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;

    invoke-direct {v1}, Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;-><init>()V

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontosDepoistoVO:Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;

    .line 61
    new-instance v1, Lcom/google/android/gms/maps/model/LatLng;

    invoke-direct {v1, v2, v3, v2, v3}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->latLongCEP:Lcom/google/android/gms/maps/model/LatLng;

    .line 63
    iput-boolean v4, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->boxAberto:Z

    .line 65
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->primeiraInicializacao:Ljava/lang/Boolean;

    aput-boolean v5, v0, v4

    return-void
.end method

.method private acaoMarkerClick(Lcom/google/android/gms/maps/model/Marker;)V
    .locals 5

    .prologue
    const/4 v4, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v1

    .line 125
    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->markerInfo:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/google/android/gms/maps/model/Marker;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;

    .line 126
    .local v0, "item":Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;
    invoke-direct {p0, v0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->escreverEnderecoNaBox(Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;)V

    .line 127
    invoke-direct {p0, p1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->selecionarPontoNoMapa(Lcom/google/android/gms/maps/model/Marker;)V

    .line 128
    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->boxInfoMakers:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->slideUpBoxEndereco:Landroid/view/animation/Animation;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 129
    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->boxInfoMakers:Landroid/widget/LinearLayout;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 130
    iput-boolean v4, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->boxAberto:Z

    .line 131
    const/16 v2, 0xd

    aput-boolean v4, v1, v2

    return-void
.end method

.method static synthetic access$000(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)Lcom/google/android/gms/maps/model/LatLng;
    .locals 4

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->latLongCEP:Lcom/google/android/gms/maps/model/LatLng;

    const/16 v2, 0x46

    const/4 v3, 0x1

    aput-boolean v3, v0, v2

    return-object v1
.end method

.method static synthetic access$100(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;Lcom/google/android/gms/maps/model/Marker;)V
    .locals 3

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    invoke-direct {p0, p1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->acaoMarkerClick(Lcom/google/android/gms/maps/model/Marker;)V

    const/16 v1, 0x47

    const/4 v2, 0x1

    aput-boolean v2, v0, v1

    return-void
.end method

.method static synthetic access$1000(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)Lcom/m4u/vivozuum/controller/RunTimePermissionManager;
    .locals 4

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->runTimePermissionManagerFineLocation:Lcom/m4u/vivozuum/controller/RunTimePermissionManager;

    const/16 v2, 0x51

    const/4 v3, 0x1

    aput-boolean v3, v0, v2

    return-object v1
.end method

.method static synthetic access$1100(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)V
    .locals 3

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->clickDialogMyLocationButton()V

    const/16 v1, 0x52

    const/4 v2, 0x1

    aput-boolean v2, v0, v1

    return-void
.end method

.method static synthetic access$1200(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)Landroid/app/Activity;
    .locals 4

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->activity:Landroid/app/Activity;

    const/16 v2, 0x53

    const/4 v3, 0x1

    aput-boolean v3, v0, v2

    return-object v1
.end method

.method static synthetic access$1300(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)Ljava/lang/String;
    .locals 4

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->title:Ljava/lang/String;

    const/16 v2, 0x54

    const/4 v3, 0x1

    aput-boolean v3, v0, v2

    return-object v1
.end method

.method static synthetic access$1400(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)Ljava/lang/String;
    .locals 4

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->messageAllowedEver:Ljava/lang/String;

    const/16 v2, 0x55

    const/4 v3, 0x1

    aput-boolean v3, v0, v2

    return-object v1
.end method

.method static synthetic access$1500(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;Ljava/lang/String;)Z
    .locals 4

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    invoke-direct {p0, p1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->buscarLatLongPorCep(Ljava/lang/String;)Z

    move-result v1

    const/16 v2, 0x56

    const/4 v3, 0x1

    aput-boolean v3, v0, v2

    return v1
.end method

.method static synthetic access$1700(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)Lcom/google/android/gms/maps/GoogleMap;
    .locals 4

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    const/16 v2, 0x57

    const/4 v3, 0x1

    aput-boolean v3, v0, v2

    return-object v1
.end method

.method static synthetic access$1800(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)V
    .locals 3

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->checkGPS()V

    const/16 v1, 0x58

    const/4 v2, 0x1

    aput-boolean v2, v0, v1

    return-void
.end method

.method static synthetic access$300(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)Landroid/widget/ImageButton;
    .locals 4

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->searchButton:Landroid/widget/ImageButton;

    const/16 v2, 0x48

    const/4 v3, 0x1

    aput-boolean v3, v0, v2

    return-object v1
.end method

.method static synthetic access$400(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)Ljava/lang/Boolean;
    .locals 4

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->primeiraInicializacao:Ljava/lang/Boolean;

    const/16 v2, 0x49

    const/4 v3, 0x1

    aput-boolean v3, v0, v2

    return-object v1
.end method

.method static synthetic access$402(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 3

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    iput-object p1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->primeiraInicializacao:Ljava/lang/Boolean;

    const/16 v1, 0x4d

    const/4 v2, 0x1

    aput-boolean v2, v0, v1

    return-object p1
.end method

.method static synthetic access$500(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)Lcom/google/android/gms/maps/model/LatLng;
    .locals 4

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->minhaLocalizacao:Lcom/google/android/gms/maps/model/LatLng;

    const/16 v2, 0x4b

    const/4 v3, 0x1

    aput-boolean v3, v0, v2

    return-object v1
.end method

.method static synthetic access$502(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/LatLng;
    .locals 3

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    iput-object p1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->minhaLocalizacao:Lcom/google/android/gms/maps/model/LatLng;

    const/16 v1, 0x4a

    const/4 v2, 0x1

    aput-boolean v2, v0, v1

    return-object p1
.end method

.method static synthetic access$600(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;Lcom/google/android/gms/maps/model/LatLng;Lcom/m4u/vivozuum/domain/enums/TipoGeoLocalizacao;)V
    .locals 3

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    invoke-direct {p0, p1, p2}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->executarServicoGeo(Lcom/google/android/gms/maps/model/LatLng;Lcom/m4u/vivozuum/domain/enums/TipoGeoLocalizacao;)V

    const/16 v1, 0x4c

    const/4 v2, 0x1

    aput-boolean v2, v0, v1

    return-void
.end method

.method static synthetic access$700(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)V
    .locals 3

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->removerSelecaoPontoNoMapa()V

    const/16 v1, 0x4e

    const/4 v2, 0x1

    aput-boolean v2, v0, v1

    return-void
.end method

.method static synthetic access$800(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)V
    .locals 3

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->fecharBoxEndereco()V

    const/16 v1, 0x4f

    const/4 v2, 0x1

    aput-boolean v2, v0, v1

    return-void
.end method

.method static synthetic access$900(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;Z)V
    .locals 3

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 49
    invoke-direct {p0, p1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->exibirEditTextCEP(Z)V

    const/16 v1, 0x50

    const/4 v2, 0x1

    aput-boolean v2, v0, v1

    return-void
.end method

.method private animarCamera()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v1

    .line 375
    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v3, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v4, v7, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "Executando anima\u00e7\u00e3o no mapa para exibir os pontos"

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 376
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->fecharBoxEndereco()V

    .line 377
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->criarBounds()Lcom/google/android/gms/maps/model/LatLngBounds;

    move-result-object v0

    .line 378
    .local v0, "bounds":Lcom/google/android/gms/maps/model/LatLngBounds;
    const/16 v2, 0x32

    invoke-static {v0, v2}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newLatLngBounds(Lcom/google/android/gms/maps/model/LatLngBounds;I)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v2

    new-instance v3, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$7;

    invoke-direct {v3, p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$7;-><init>(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)V

    invoke-direct {p0, v2, v3}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->moverCameraComAnimacao(Lcom/google/android/gms/maps/CameraUpdate;Lcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V

    .line 389
    const/16 v2, 0x37

    aput-boolean v7, v1, v2

    return-void
.end method

.method private buscarLatLongPorCep(Ljava/lang/String;)Z
    .locals 12

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v6

    .line 338
    iget-object v3, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v7, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v8, v4, [Ljava/lang/Object;

    const-string v9, "Executando servi\u00e7o de busca pelo cep ..."

    aput-object v9, v8, v5

    invoke-virtual {v3, v7, v8}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 339
    new-instance v3, Landroid/location/Geocoder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-direct {v3, p0, v7}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;Ljava/util/Locale;)V

    const/16 v7, 0x30

    const/4 v8, 0x1

    :try_start_0
    aput-boolean v8, v6, v7

    .line 341
    iget-object v7, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v7}, Lcom/google/android/gms/maps/GoogleMap;->clear()V

    .line 342
    invoke-static {p1}, Lcom/m4u/vivozuum/formatter/MascaradorTextWatcher;->removeMascara(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 343
    .local v1, "cep":Ljava/lang/String;
    const/4 v7, 0x1

    invoke-virtual {v3, v1, v7}, Landroid/location/Geocoder;->getFromLocationName(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v0

    .line 344
    .local v0, "addresses":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    new-instance v7, Lcom/google/android/gms/maps/model/LatLng;

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/location/Address;

    invoke-virtual {v3}, Landroid/location/Address;->getLatitude()D

    move-result-wide v8

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/location/Address;

    invoke-virtual {v3}, Landroid/location/Address;->getLongitude()D

    move-result-wide v10

    invoke-direct {v7, v8, v9, v10, v11}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    iput-object v7, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->latLongCEP:Lcom/google/android/gms/maps/model/LatLng;

    .line 345
    iget-object v3, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->latLongCEP:Lcom/google/android/gms/maps/model/LatLng;

    invoke-direct {p0, v3}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->setLatLongConsultada(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 346
    iget-object v3, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    new-instance v7, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v7}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    iget-object v8, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->latLongCEP:Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v7, v8}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    .line 347
    iget-object v3, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->latLongCEP:Lcom/google/android/gms/maps/model/LatLng;

    sget-object v7, Lcom/m4u/vivozuum/domain/enums/TipoGeoLocalizacao;->REF_CEP:Lcom/m4u/vivozuum/domain/enums/TipoGeoLocalizacao;

    invoke-direct {p0, v3, v7}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->executarServicoGeo(Lcom/google/android/gms/maps/model/LatLng;Lcom/m4u/vivozuum/domain/enums/TipoGeoLocalizacao;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 348
    const/16 v3, 0x31

    aput-boolean v4, v6, v3

    move v3, v4

    .line 351
    .end local v0    # "addresses":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    :goto_0
    return v3

    .line 349
    :catch_0
    move-exception v2

    .line 350
    .local v2, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v7, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v8, v4, [Ljava/lang/Object;

    const-string v9, "erro buscar por CEP"

    aput-object v9, v8, v5

    invoke-virtual {v3, v7, v8}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 351
    const/16 v3, 0x32

    aput-boolean v4, v6, v3

    move v3, v5

    goto :goto_0
.end method

.method private checkGPS()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 93
    invoke-virtual {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/m4u/vivozuum/util/android/AndroidUtil;->isGPSHabilitado(Landroid/content/Context;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 94
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->configurarLocationListenerMap()V

    const/4 v1, 0x5

    aput-boolean v2, v0, v1

    .line 98
    :goto_0
    const/4 v1, 0x7

    aput-boolean v2, v0, v1

    return-void

    .line 96
    :cond_0
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->exibirDialogGPS()V

    const/4 v1, 0x6

    aput-boolean v2, v0, v1

    goto :goto_0
.end method

.method private clickDialogMyLocationButton()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 268
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->minhaLocalizacao:Lcom/google/android/gms/maps/model/LatLng;

    if-nez v1, :cond_0

    const/16 v1, 0x1c

    aput-boolean v3, v0, v1

    .line 274
    :goto_0
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->exibirDialogGPS()V

    const/16 v1, 0x1f

    aput-boolean v3, v0, v1

    .line 276
    :goto_1
    const/16 v1, 0x20

    aput-boolean v3, v0, v1

    return-void

    .line 268
    :cond_0
    invoke-virtual {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/m4u/vivozuum/util/android/AndroidUtil;->isGPSHabilitado(Landroid/content/Context;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_1

    const/16 v1, 0x1d

    aput-boolean v3, v0, v1

    goto :goto_0

    .line 269
    :cond_1
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->fecharBoxEndereco()V

    .line 270
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/GoogleMap;->clear()V

    .line 271
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->minhaLocalizacao:Lcom/google/android/gms/maps/model/LatLng;

    sget-object v2, Lcom/m4u/vivozuum/domain/enums/TipoGeoLocalizacao;->REF_LOCAL:Lcom/m4u/vivozuum/domain/enums/TipoGeoLocalizacao;

    invoke-direct {p0, v1, v2}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->executarServicoGeo(Lcom/google/android/gms/maps/model/LatLng;Lcom/m4u/vivozuum/domain/enums/TipoGeoLocalizacao;)V

    .line 272
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->exibirEditTextCEP(Z)V

    const/16 v1, 0x1e

    aput-boolean v3, v0, v1

    goto :goto_1
.end method

.method private configurarCliqueMyLocationButton()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 241
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Configurando a\u00e7\u00e3o do bot\u00e3o da minha localiza\u00e7\u00e3o ..."

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 242
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    new-instance v2, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$6;

    invoke-direct {v2, p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$6;-><init>(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setOnMyLocationButtonClickListener(Lcom/google/android/gms/maps/GoogleMap$OnMyLocationButtonClickListener;)V

    .line 265
    const/16 v1, 0x1b

    aput-boolean v6, v0, v1

    return-void
.end method

.method private configurarCliqueNoMapa()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 228
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Configurando a\u00e7\u00e3o de quando o mapa recebe um clique ..."

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 229
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    new-instance v2, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$5;

    invoke-direct {v2, p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$5;-><init>(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setOnMapClickListener(Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;)V

    .line 238
    const/16 v1, 0x1a

    aput-boolean v6, v0, v1

    return-void
.end method

.method private configurarComponentes()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    const v8, 0x7f0e00a4

    const/4 v7, 0x1

    const/4 v6, 0x0

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v2

    .line 161
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v3, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v4, v7, [Ljava/lang/Object;

    const-string v5, "Configurando componentes da tela ..."

    aput-object v5, v4, v6

    invoke-virtual {v1, v3, v4}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 162
    invoke-virtual {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const v3, 0x7f0e0159

    invoke-virtual {v1, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/maps/SupportMapFragment;

    .line 163
    .local v0, "mapFra":Lcom/google/android/gms/maps/SupportMapFragment;
    invoke-virtual {v0}, Lcom/google/android/gms/maps/SupportMapFragment;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v1

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    .line 164
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/GoogleMap;->getUiSettings()Lcom/google/android/gms/maps/UiSettings;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/google/android/gms/maps/UiSettings;->setZoomControlsEnabled(Z)V

    .line 165
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1}, Lcom/google/android/gms/maps/GoogleMap;->getUiSettings()Lcom/google/android/gms/maps/UiSettings;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/google/android/gms/maps/UiSettings;->setMapToolbarEnabled(Z)V

    .line 166
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->configurarCliqueNoMapa()V

    .line 167
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->configurarCliqueMyLocationButton()V

    .line 168
    const v1, 0x7f0e00d5

    invoke-virtual {p0, v1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->textViewBoxTitulo:Landroid/widget/TextView;

    .line 169
    invoke-virtual {p0, v8}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->searchButton:Landroid/widget/ImageButton;

    .line 170
    const v1, 0x7f0e00d7

    invoke-virtual {p0, v1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->textViewBoxRua:Landroid/widget/TextView;

    .line 171
    const v1, 0x7f0e00d8

    invoke-virtual {p0, v1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->textViewBoxCidade:Landroid/widget/TextView;

    .line 172
    const v1, 0x7f0e00a6

    invoke-virtual {p0, v1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->textViewTituloActionBar:Landroid/widget/TextView;

    .line 173
    const v1, 0x7f0e015a

    invoke-virtual {p0, v1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->boxInfoMakers:Landroid/widget/LinearLayout;

    .line 174
    invoke-virtual {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f04000b

    invoke-static {v1, v3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->slideUpBoxEndereco:Landroid/view/animation/Animation;

    .line 175
    invoke-virtual {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f04000a

    invoke-static {v1, v3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->slideDownBoxEndereco:Landroid/view/animation/Animation;

    .line 176
    const v1, 0x7f0e00a7

    invoke-virtual {p0, v1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->editTextCEP:Landroid/widget/EditText;

    .line 177
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->editTextCEP:Landroid/widget/EditText;

    new-instance v3, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$AcaoMascaraCEP;

    const-string v4, "#####-###"

    iget-object v5, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->editTextCEP:Landroid/widget/EditText;

    invoke-direct {v3, p0, v4, v5, p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$AcaoMascaraCEP;-><init>(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;Ljava/lang/String;Landroid/widget/EditText;Landroid/app/Activity;)V

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 178
    invoke-virtual {p0, v8}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->buttonPesquisarCEP:Landroid/widget/ImageButton;

    .line 179
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->congigurarFontesDosComponentes()V

    .line 180
    new-instance v1, Lcom/m4u/vivozuum/controller/RunTimePermissionManager;

    new-instance v3, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$RequestPermissionCallBack;

    invoke-direct {v3, p0, v9}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$RequestPermissionCallBack;-><init>(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$1;)V

    sget-object v4, Lcom/m4u/vivozuum/controller/RunTimePermissionManager;->PERMISSION_FINE_LOCATION:Ljava/lang/String;

    invoke-direct {v1, p0, v3, v4}, Lcom/m4u/vivozuum/controller/RunTimePermissionManager;-><init>(Landroid/app/Activity;Lcom/m4u/vivozuum/controller/RunTimePermissionManager$CallBack;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->runTimePermissionManagerFineLocation:Lcom/m4u/vivozuum/controller/RunTimePermissionManager;

    .line 181
    new-instance v1, Lcom/m4u/vivozuum/controller/RunTimePermissionManager;

    sget-object v3, Lcom/m4u/vivozuum/controller/RunTimePermissionManager;->PERMISSION_COARSE_LOCATION:Ljava/lang/String;

    invoke-direct {v1, p0, v9, v3}, Lcom/m4u/vivozuum/controller/RunTimePermissionManager;-><init>(Landroid/app/Activity;Lcom/m4u/vivozuum/controller/RunTimePermissionManager$CallBack;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->runTimePermissionManagerCourseLocation:Lcom/m4u/vivozuum/controller/RunTimePermissionManager;

    .line 182
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->runTimePermissionManagerFineLocation:Lcom/m4u/vivozuum/controller/RunTimePermissionManager;

    invoke-virtual {v1}, Lcom/m4u/vivozuum/controller/RunTimePermissionManager;->request()V

    .line 183
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->runTimePermissionManagerCourseLocation:Lcom/m4u/vivozuum/controller/RunTimePermissionManager;

    invoke-virtual {v1}, Lcom/m4u/vivozuum/controller/RunTimePermissionManager;->request()V

    .line 184
    const/16 v1, 0x16

    aput-boolean v7, v2, v1

    return-void
.end method

.method private configurarLocationListenerMap()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 213
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Configurando listener do servi\u00e7o de localiza\u00e7\u00e3op da api do maps ..."

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 214
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    new-instance v2, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$4;

    invoke-direct {v2, p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$4;-><init>(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setOnMyLocationChangeListener(Lcom/google/android/gms/maps/GoogleMap$OnMyLocationChangeListener;)V

    .line 225
    const/16 v1, 0x19

    aput-boolean v6, v0, v1

    return-void
.end method

.method private congigurarFontesDosComponentes()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 187
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Configurando fontes dos componentes necess\u00e1rios ..."

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 188
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->fontesUtil:Lcom/m4u/vivozuum/util/FontesUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->textViewBoxTitulo:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Lcom/m4u/vivozuum/util/FontesUtil;->alterarFontesBold(Landroid/view/View;)V

    .line 189
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->fontesUtil:Lcom/m4u/vivozuum/util/FontesUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->textViewTituloActionBar:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Lcom/m4u/vivozuum/util/FontesUtil;->alterarFontesBold(Landroid/view/View;)V

    .line 190
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->fontesUtil:Lcom/m4u/vivozuum/util/FontesUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->textViewBoxRua:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Lcom/m4u/vivozuum/util/FontesUtil;->alterarFontesPadrao(Landroid/view/View;)V

    .line 191
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->fontesUtil:Lcom/m4u/vivozuum/util/FontesUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->textViewBoxCidade:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Lcom/m4u/vivozuum/util/FontesUtil;->alterarFontesPadrao(Landroid/view/View;)V

    .line 192
    const/16 v1, 0x17

    aput-boolean v6, v0, v1

    return-void
.end method

.method private criarBounds()Lcom/google/android/gms/maps/model/LatLngBounds;
    .locals 15

    .prologue
    const/4 v2, 0x0

    const/4 v14, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v8

    .line 396
    iget-object v7, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v9, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v10, v14, [Ljava/lang/Object;

    const-string v11, "Criando bounds para exibir todos os pontos com o zoom ideal ..."

    aput-object v11, v10, v2

    invoke-virtual {v7, v9, v10}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 397
    iget-object v7, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontosDepoistoVO:Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;

    invoke-virtual {v7}, Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;->getItensGeoLocalizacao()Ljava/util/List;

    move-result-object v3

    .line 398
    .local v3, "itens":Ljava/util/List;, "Ljava/util/List<Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;>;"
    new-instance v1, Lcom/google/android/gms/maps/model/LatLngBounds$Builder;

    invoke-direct {v1}, Lcom/google/android/gms/maps/model/LatLngBounds$Builder;-><init>()V

    .line 400
    .local v1, "builder":Lcom/google/android/gms/maps/model/LatLngBounds$Builder;
    const/16 v7, 0x39

    aput-boolean v14, v8, v7

    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v7

    if-ge v2, v7, :cond_0

    .line 401
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;

    invoke-virtual {v7}, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;->getLatitude()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v4

    .line 402
    .local v4, "latitude":Ljava/lang/Double;
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;

    invoke-virtual {v7}, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;->getLongitude()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v5

    .line 403
    .local v5, "longitude":Ljava/lang/Double;
    new-instance v6, Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v12

    invoke-direct {v6, v10, v11, v12, v13}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 404
    .local v6, "posicao":Lcom/google/android/gms/maps/model/LatLng;
    invoke-virtual {v1, v6}, Lcom/google/android/gms/maps/model/LatLngBounds$Builder;->include(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/LatLngBounds$Builder;

    .line 400
    add-int/lit8 v2, v2, 0x1

    .local v2, "i":I
    const/16 v7, 0x3a

    aput-boolean v14, v8, v7

    goto :goto_0

    .line 406
    .end local v2    # "i":I
    .end local v4    # "latitude":Ljava/lang/Double;
    .end local v5    # "longitude":Ljava/lang/Double;
    .end local v6    # "posicao":Lcom/google/android/gms/maps/model/LatLng;
    :cond_0
    new-instance v7, Lcom/google/android/gms/maps/model/LatLng;

    iget-object v9, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontosDepoistoVO:Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;

    invoke-virtual {v9}, Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;->getLatitudeConsultada()D

    move-result-wide v10

    iget-object v9, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontosDepoistoVO:Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;

    invoke-virtual {v9}, Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;->getLongitudeConsultada()D

    move-result-wide v12

    invoke-direct {v7, v10, v11, v12, v13}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    invoke-virtual {v1, v7}, Lcom/google/android/gms/maps/model/LatLngBounds$Builder;->include(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/LatLngBounds$Builder;

    .line 407
    invoke-virtual {v1}, Lcom/google/android/gms/maps/model/LatLngBounds$Builder;->build()Lcom/google/android/gms/maps/model/LatLngBounds;

    move-result-object v0

    .line 408
    .local v0, "bounds":Lcom/google/android/gms/maps/model/LatLngBounds;
    const/16 v7, 0x3b

    aput-boolean v14, v8, v7

    return-object v0
.end method

.method private definirMarkerClick()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 112
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Defininfo a\u00e7a\u00f5 de clique dos pontos no mapa"

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 113
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    new-instance v2, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$1;

    invoke-direct {v2, p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$1;-><init>(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setOnMarkerClickListener(Lcom/google/android/gms/maps/GoogleMap$OnMarkerClickListener;)V

    .line 122
    const/16 v1, 0xc

    aput-boolean v6, v0, v1

    return-void
.end method

.method private escreverEnderecoNaBox(Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;)V
    .locals 10

    .prologue
    const/4 v9, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v3

    .line 150
    iget-object v4, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v5, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v6, v9, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string v8, "Escrevendo informa\u00e7\u1ebdos do ponto na box animada..."

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 151
    invoke-virtual {p1}, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;->getNome()Ljava/lang/String;

    move-result-object v2

    .line 152
    .local v2, "tituloBox":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;->getLogradouro()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;->getNumero()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;->getBairro()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 153
    .local v1, "ruaNumeroBairro":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;->getCidade()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " - "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;->getUf()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;->getCep()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", Brasil"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, "cidadePaisCEP":Ljava/lang/String;
    iget-object v4, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->textViewBoxTitulo:Landroid/widget/TextView;

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    iget-object v4, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->textViewBoxRua:Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    iget-object v4, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->textViewBoxCidade:Landroid/widget/TextView;

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    const/16 v4, 0x15

    aput-boolean v9, v3, v4

    return-void
.end method

.method private executarAcaoRespostaOpercaoZuum(Lcom/m4u/vivozuum/domain/response/DepositPointsResponse;)V
    .locals 6

    .prologue
    const/4 v5, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v3

    .line 356
    invoke-virtual {p1}, Lcom/m4u/vivozuum/domain/response/DepositPointsResponse;->getLocalizations()Ljava/util/List;

    move-result-object v2

    .line 357
    .local v2, "itensGeoLocalizacao":Ljava/util/List;, "Ljava/util/List<Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;>;"
    iget-object v4, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontosDepoistoVO:Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;

    invoke-virtual {v4, v2}, Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;->setItensGeoLocalizacao(Ljava/util/List;)V

    .line 358
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->markerInfo:Ljava/util/Map;

    .line 359
    const/4 v0, 0x0

    const/16 v4, 0x33

    aput-boolean v5, v3, v4

    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_0

    .line 360
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;

    .line 361
    .local v1, "itemGeoLocalizacao":Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;
    invoke-direct {p0, v1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->inserirPontoNoMapa(Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;)V

    .line 359
    add-int/lit8 v0, v0, 0x1

    .local v0, "i":I
    const/16 v4, 0x34

    aput-boolean v5, v3, v4

    goto :goto_0

    .line 364
    .end local v0    # "i":I
    .end local v1    # "itemGeoLocalizacao":Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;
    :cond_0
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->definirMarkerClick()V

    .line 365
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->animarCamera()V

    .line 366
    const/16 v4, 0x35

    aput-boolean v5, v3, v4

    return-void
.end method

.method private executarServicoGeo(Lcom/google/android/gms/maps/model/LatLng;Lcom/m4u/vivozuum/domain/enums/TipoGeoLocalizacao;)V
    .locals 9

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v2

    .line 101
    iget-object v3, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v4, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v5, v7, [Ljava/lang/Object;

    const-string v6, "Executando servi\u00e7o de geo localizador ..."

    aput-object v6, v5, v8

    invoke-virtual {v3, v4, v5}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 102
    invoke-direct {p0, p1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->setLatLongConsultada(Lcom/google/android/gms/maps/model/LatLng;)V

    const/16 v3, 0x8

    const/4 v4, 0x1

    :try_start_0
    aput-boolean v4, v2, v3

    .line 104
    new-instance v1, Lcom/m4u/vivozuum/servicos/zuum/geo/ServicoGeo;

    invoke-direct {v1, p0, p1, p2}, Lcom/m4u/vivozuum/servicos/zuum/geo/ServicoGeo;-><init>(Lcom/m4u/vivozuum/servicos/zuum/interfaces/RetornoOperacaoZuum;Lcom/google/android/gms/maps/model/LatLng;Lcom/m4u/vivozuum/domain/enums/TipoGeoLocalizacao;)V

    .line 105
    .local v1, "servicoGeo":Lcom/m4u/vivozuum/servicos/zuum/geo/ServicoGeo;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v3}, Lcom/m4u/vivozuum/servicos/zuum/geo/ServicoGeo;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Lcom/m4u/vivozuum/excecao/VivoZuumException; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    const/16 v3, 0x9

    aput-boolean v7, v2, v3

    .line 109
    :goto_0
    const/16 v3, 0xb

    aput-boolean v7, v2, v3

    return-void

    .line 106
    :catch_0
    move-exception v0

    .line 107
    .local v0, "e":Lcom/m4u/vivozuum/excecao/VivoZuumException;
    iget-object v3, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v4, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v5, v7, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/m4u/vivozuum/excecao/VivoZuumException;->getMensagem()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-virtual {v3, v4, v5}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    const/16 v3, 0xa

    aput-boolean v7, v2, v3

    goto :goto_0
.end method

.method private exibirDialogGPS()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 195
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Exibi\u00e7\u00e3o do dialog informativo quando o gps est\u00e1 desabilitado ..."

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 196
    const-string v1, "Aten\u00e7\u00e3o"

    const v2, 0x7f0700ae

    .line 197
    invoke-virtual {p0, v2}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$2;

    invoke-direct {v3, p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$2;-><init>(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)V

    new-instance v4, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$3;

    invoke-direct {v4, p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity$3;-><init>(Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;)V

    .line 196
    invoke-static {p0, v1, v2, v3, v4}, Lcom/m4u/vivozuum/util/DialogUtil;->exibirAlertDialogConfirmarCancelar(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 210
    const/16 v1, 0x18

    aput-boolean v6, v0, v1

    return-void
.end method

.method private exibirEditTextCEP(Z)V
    .locals 8

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x1

    const/4 v5, 0x0

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 312
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const-string v4, "Executando a\u00e7\u00e3o para exivir o campo de cep ..."

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 313
    if-eqz p1, :cond_0

    .line 314
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->editTextCEP:Landroid/widget/EditText;

    invoke-virtual {v1, v5}, Landroid/widget/EditText;->setVisibility(I)V

    .line 315
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->editTextCEP:Landroid/widget/EditText;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 316
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->textViewTituloActionBar:Landroid/widget/TextView;

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 317
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->buttonPesquisarCEP:Landroid/widget/ImageButton;

    invoke-virtual {v1, v7}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 318
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->editTextCEP:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    const/16 v1, 0x2c

    aput-boolean v6, v0, v1

    .line 325
    :goto_0
    const/16 v1, 0x2e

    aput-boolean v6, v0, v1

    return-void

    .line 320
    :cond_0
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->editTextCEP:Landroid/widget/EditText;

    invoke-virtual {v1, v7}, Landroid/widget/EditText;->setVisibility(I)V

    .line 321
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->editTextCEP:Landroid/widget/EditText;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 322
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->textViewTituloActionBar:Landroid/widget/TextView;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 323
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->buttonPesquisarCEP:Landroid/widget/ImageButton;

    invoke-virtual {v1, v5}, Landroid/widget/ImageButton;->setVisibility(I)V

    const/16 v1, 0x2d

    aput-boolean v6, v0, v1

    goto :goto_0
.end method

.method private fecharBoxEndereco()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 279
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v5, [Ljava/lang/Object;

    const-string v4, "Fechando box do endere\u00e7o com a anima\u00e7\u00e3o ..."

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 280
    iget-boolean v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->boxAberto:Z

    if-nez v1, :cond_0

    const/16 v1, 0x21

    aput-boolean v5, v0, v1

    .line 285
    :goto_0
    const/16 v1, 0x23

    aput-boolean v5, v0, v1

    return-void

    .line 281
    :cond_0
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->boxInfoMakers:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->slideDownBoxEndereco:Landroid/view/animation/Animation;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 282
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->boxInfoMakers:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 283
    iput-boolean v6, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->boxAberto:Z

    const/16 v1, 0x22

    aput-boolean v5, v0, v1

    goto :goto_0
.end method

.method private inserirPontoNoMapa(Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;)V
    .locals 13

    .prologue
    const/4 v12, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v5

    .line 328
    iget-object v6, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v7, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v8, v12, [Ljava/lang/Object;

    const/4 v9, 0x0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Inserindo ponto "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p1}, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;->getNome()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " no mapa ... "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v6, v7, v8}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 329
    invoke-virtual {p1}, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;->getLatitude()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    .line 330
    .local v1, "latitude":Ljava/lang/Double;
    invoke-virtual {p1}, Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;->getLongitude()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v2

    .line 331
    .local v2, "longitude":Ljava/lang/Double;
    new-instance v4, Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    invoke-direct {v4, v6, v7, v8, v9}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 332
    .local v4, "posicao":Lcom/google/android/gms/maps/model/LatLng;
    new-instance v6, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v6}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    invoke-virtual {v6, v4}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v6

    const v7, 0x7f0200b0

    invoke-static {v7}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/android/gms/maps/model/MarkerOptions;->icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v3

    .line 333
    .local v3, "makerOptions":Lcom/google/android/gms/maps/model/MarkerOptions;
    iget-object v6, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v6, v3}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/android/gms/maps/model/Marker;->getId()Ljava/lang/String;

    move-result-object v0

    .line 334
    .local v0, "idMaker":Ljava/lang/String;
    iget-object v6, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->markerInfo:Ljava/util/Map;

    invoke-interface {v6, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    const/16 v6, 0x2f

    aput-boolean v12, v5, v6

    return-void
.end method

.method private moverCameraComAnimacao(Lcom/google/android/gms/maps/CameraUpdate;Lcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V
    .locals 3

    .prologue
    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 392
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    const/16 v2, 0xbb8

    invoke-virtual {v1, p1, v2, p2}, Lcom/google/android/gms/maps/GoogleMap;->animateCamera(Lcom/google/android/gms/maps/CameraUpdate;ILcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V

    .line 393
    const/16 v1, 0x38

    const/4 v2, 0x1

    aput-boolean v2, v0, v1

    return-void
.end method

.method private removerSelecaoPontoNoMapa()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 143
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Removendo ponto selecionado no mapa..."

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 144
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontoSelecionadoNoMapa:Lcom/google/android/gms/maps/model/Marker;

    if-nez v1, :cond_0

    const/16 v1, 0x12

    aput-boolean v6, v0, v1

    .line 147
    :goto_0
    const/16 v1, 0x14

    aput-boolean v6, v0, v1

    return-void

    .line 145
    :cond_0
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontoSelecionadoNoMapa:Lcom/google/android/gms/maps/model/Marker;

    const v2, 0x7f0200b0

    invoke-static {v2}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/model/Marker;->setIcon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)V

    const/16 v1, 0x13

    aput-boolean v6, v0, v1

    goto :goto_0
.end method

.method private selecionarPontoNoMapa(Lcom/google/android/gms/maps/model/Marker;)V
    .locals 7

    .prologue
    const/4 v6, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 134
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Selecionando ponto no mapa ..."

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 135
    const v1, 0x7f0200b1

    invoke-static {v1}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/google/android/gms/maps/model/Marker;->setIcon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)V

    .line 136
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontoSelecionadoNoMapa:Lcom/google/android/gms/maps/model/Marker;

    if-nez v1, :cond_0

    const/16 v1, 0xe

    aput-boolean v6, v0, v1

    .line 139
    :goto_0
    iput-object p1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontoSelecionadoNoMapa:Lcom/google/android/gms/maps/model/Marker;

    .line 140
    const/16 v1, 0x11

    aput-boolean v6, v0, v1

    return-void

    .line 136
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/maps/model/Marker;->getId()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontoSelecionadoNoMapa:Lcom/google/android/gms/maps/model/Marker;

    invoke-virtual {v2}, Lcom/google/android/gms/maps/model/Marker;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0xf

    aput-boolean v6, v0, v1

    goto :goto_0

    .line 137
    :cond_1
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontoSelecionadoNoMapa:Lcom/google/android/gms/maps/model/Marker;

    const v2, 0x7f0200b0

    invoke-static {v2}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromResource(I)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/model/Marker;->setIcon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)V

    const/16 v1, 0x10

    aput-boolean v6, v0, v1

    goto :goto_0
.end method

.method private setLatLongConsultada(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 7

    .prologue
    const/4 v6, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 369
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Armazenando ultima latitude e longitude consultada ..."

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 370
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontosDepoistoVO:Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;

    iget-wide v2, p1, Lcom/google/android/gms/maps/model/LatLng;->latitude:D

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;->setLatitudeConsultada(D)V

    .line 371
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontosDepoistoVO:Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;

    iget-wide v2, p1, Lcom/google/android/gms/maps/model/LatLng;->longitude:D

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;->setLongitudeConsultada(D)V

    .line 372
    const/16 v1, 0x36

    aput-boolean v6, v0, v1

    return-void
.end method


# virtual methods
.method public acaoBotaoListMenu(Landroid/view/View;)V
    .locals 9

    .prologue
    const/4 v8, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v2

    .line 300
    iget-object v3, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v4, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v5, v8, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "Executando a\u00e7\u00e3o bot\u00e3o listar pontos ..."

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 301
    iget-object v3, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontosDepoistoVO:Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;

    invoke-virtual {v3}, Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;->getItensGeoLocalizacao()Ljava/util/List;

    move-result-object v1

    .line 302
    .local v1, "pontos":Ljava/util/List;, "Ljava/util/List<Lcom/m4u/vivozuum/domain/transacionais/ItemGeoLocalizacao;>;"
    if-nez v1, :cond_0

    const/16 v3, 0x27

    aput-boolean v8, v2, v3

    .line 303
    :goto_0
    const-string v3, "Aten\u00e7\u00e3o"

    const v4, 0x7f0700af

    invoke-virtual {p0, v4}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {p0, v3, v4, v5}, Lcom/m4u/vivozuum/util/DialogUtil;->criarAlertDialogOk(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)Landroid/app/Dialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Dialog;->show()V

    const/16 v3, 0x29

    aput-boolean v8, v2, v3

    .line 309
    :goto_1
    const/16 v3, 0x2b

    aput-boolean v8, v2, v3

    return-void

    .line 302
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    const/16 v3, 0x28

    aput-boolean v8, v2, v3

    goto :goto_0

    .line 305
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lcom/m4u/vivozuum/activities/depositos/PontosDepositosActivity;

    invoke-direct {v0, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 306
    .local v0, "intent":Landroid/content/Intent;
    const-string v3, "pontosDeDeposito"

    iget-object v4, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontosDepoistoVO:Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 307
    invoke-virtual {p0, v0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->startActivity(Landroid/content/Intent;)V

    const/16 v3, 0x2a

    aput-boolean v8, v2, v3

    goto :goto_1
.end method

.method public acaoBotaoPesquisarCEP(Landroid/view/View;)V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 288
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v5, [Ljava/lang/Object;

    const-string v4, "Executando a\u00e7\u00e3o do bo\u00e3o pesquisar cep ..."

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 289
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v5, [Ljava/lang/Object;

    const-string v4, " "

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 290
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->editTextCEP:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_0

    .line 291
    invoke-direct {p0, v5}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->exibirEditTextCEP(Z)V

    .line 292
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->editTextCEP:Landroid/widget/EditText;

    invoke-static {p0, v1}, Lcom/m4u/vivozuum/util/android/AndroidUtil;->exibirTeclado(Landroid/app/Activity;Landroid/widget/EditText;)V

    const/16 v1, 0x24

    aput-boolean v5, v0, v1

    .line 297
    :goto_0
    const/16 v1, 0x26

    aput-boolean v5, v0, v1

    return-void

    .line 294
    :cond_0
    invoke-direct {p0, v6}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->exibirEditTextCEP(Z)V

    const/16 v1, 0x25

    aput-boolean v5, v0, v1

    goto :goto_0
.end method

.method public fail(Lcom/m4u/vivozuum/mensagens/integracao/zuum/ResponseZuum;)V
    .locals 7

    .prologue
    const/4 v6, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 428
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Resposta erro da opera\u00e7\u00e3o servi\u00e7o geo localizador ..."

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 429
    const v1, 0x7f0701ff

    invoke-virtual {p0, v1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, v1}, Lcom/m4u/vivozuum/controller/ErroController;->tratarErro(Lcom/m4u/vivozuum/activities/ZuumActivity;Lcom/m4u/vivozuum/mensagens/integracao/zuum/ResponseZuum;Ljava/lang/String;)V

    .line 430
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontosDepoistoVO:Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;

    invoke-virtual {v1}, Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;->getItensGeoLocalizacao()Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_0

    const/16 v1, 0x40

    aput-boolean v6, v0, v1

    .line 434
    :goto_0
    const/16 v1, 0x42

    aput-boolean v6, v0, v1

    return-void

    .line 431
    :cond_0
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->pontosDepoistoVO:Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;

    invoke-virtual {v1}, Lcom/m4u/vivozuum/vo/integracao/zuum/pontosdeposito/PontosDepositoVO;->getItensGeoLocalizacao()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->clear()V

    const/16 v1, 0x41

    aput-boolean v6, v0, v1

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 413
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->editTextCEP:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    .line 414
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->exibirEditTextCEP(Z)V

    const/16 v1, 0x3c

    aput-boolean v2, v0, v1

    .line 418
    :goto_0
    const/16 v1, 0x3e

    aput-boolean v2, v0, v1

    return-void

    .line 416
    :cond_0
    invoke-virtual {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->finish()V

    const/16 v1, 0x3d

    aput-boolean v2, v0, v1

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .prologue
    const/4 v2, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 75
    invoke-super {p0, p1}, Lcom/m4u/vivozuum/activities/ZuumActivity;->onCreate(Landroid/os/Bundle;)V

    .line 76
    const v1, 0x7f03007d

    invoke-virtual {p0, v1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->setContentView(I)V

    .line 77
    iput-object p0, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->activity:Landroid/app/Activity;

    .line 78
    const v1, 0x7f0700ef

    invoke-virtual {p0, v1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->messageAllowedEver:Ljava/lang/String;

    .line 79
    const v1, 0x7f0701b2

    invoke-virtual {p0, v1}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->title:Ljava/lang/String;

    .line 80
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->configurarComponentes()V

    .line 81
    aput-boolean v2, v0, v2

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 3

    .prologue
    const/4 v2, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 504
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->runTimePermissionManagerCourseLocation:Lcom/m4u/vivozuum/controller/RunTimePermissionManager;

    invoke-virtual {v1}, Lcom/m4u/vivozuum/controller/RunTimePermissionManager;->permissionAllow()Z

    move-result v1

    if-nez v1, :cond_0

    const/16 v1, 0x43

    aput-boolean v2, v0, v1

    .line 507
    :goto_0
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->searchButton:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/widget/ImageButton;->performClick()Z

    .line 508
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->map:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMap;->setMyLocationEnabled(Z)V

    .line 509
    const/16 v1, 0x45

    aput-boolean v2, v0, v1

    return-void

    .line 505
    :cond_0
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->checkGPS()V

    const/16 v1, 0x44

    aput-boolean v2, v0, v1

    goto :goto_0
.end method

.method protected onResume()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v0

    .line 85
    invoke-super {p0}, Lcom/m4u/vivozuum/activities/ZuumActivity;->onResume()V

    .line 86
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Verificando se o gps est\u00e1 habilitado."

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 87
    iget-object v1, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->runTimePermissionManagerFineLocation:Lcom/m4u/vivozuum/controller/RunTimePermissionManager;

    invoke-virtual {v1}, Lcom/m4u/vivozuum/controller/RunTimePermissionManager;->permissionAllow()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x2

    aput-boolean v6, v0, v1

    .line 90
    :goto_0
    const/4 v1, 0x4

    aput-boolean v6, v0, v1

    return-void

    .line 88
    :cond_0
    invoke-direct {p0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->checkGPS()V

    const/4 v1, 0x3

    aput-boolean v6, v0, v1

    goto :goto_0
.end method

.method public success(Lcom/m4u/vivozuum/mensagens/integracao/zuum/ResponseZuum;)V
    .locals 7

    .prologue
    const/4 v6, 0x1

    invoke-static {}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->$jacocoInit()[Z

    move-result-object v1

    .line 422
    iget-object v0, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->logger:Lcom/m4u/vivozuum/util/android/AndroidLogUtil;

    iget-object v2, p0, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->LOG_CONSTANT:Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Resposta sucesso da opera\u00e7\u00e3o servi\u00e7o geolocalizador ..."

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Lcom/m4u/vivozuum/util/android/AndroidLogUtil;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 423
    invoke-virtual {p1}, Lcom/m4u/vivozuum/mensagens/integracao/zuum/ResponseZuum;->getRespostaZuum()Lcom/m4u/vivozuum/domain/response/HeaderResponse;

    move-result-object v0

    check-cast v0, Lcom/m4u/vivozuum/domain/response/DepositPointsResponse;

    invoke-direct {p0, v0}, Lcom/m4u/vivozuum/activities/depositos/MapaPontosDepositoActivity;->executarAcaoRespostaOpercaoZuum(Lcom/m4u/vivozuum/domain/response/DepositPointsResponse;)V

    .line 424
    const/16 v0, 0x3f

    aput-boolean v6, v1, v0

    return-void
.end method