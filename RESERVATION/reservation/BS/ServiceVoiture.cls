Class reservation.BS.ServiceVoiture Extends Ens.BusinessService
{

/// Name of the WebService
Parameter SERVICENAME = "ServiceVoiture";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
    set tsc = $CASE(pHint,
        "creerVoiture":..creerVoiture(pInput,.pOutput),
        "voitureCreerSinistre":..voitureCreerSinistre(pInput,.pOutput),
	 	: $$$ERROR($$$NotImplemented)
    )
    Quit tsc
}

Method creerVoiture(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    set tsc = ..SendRequestSync("Voiture",pInput,.pOutput)
    Quit $$$OK
}

Method voitureCreerSinistre(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    set tsc = ..SendRequestSync("GestionSinistre",pInput,.pOutput)
    Quit $$$OK
}

}

