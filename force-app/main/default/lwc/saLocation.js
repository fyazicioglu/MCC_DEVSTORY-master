import { LightningElement, api, wire} from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
//Set SAdetails Object fields
const NAME_FIELD = 'SA_Detail__c.Name__c';
const LOCATION_LATITUDE_FIELD = 'SA_Detail__c.Location__Latitude__s';
const LOCATION_LONGITUDE_FIELD = 'SA_Detail__c.Location__Longitude__s';
const sadetailfields = [
    NAME_FIELD,
    LOCATION_LATITUDE_FIELD,
    LOCATION_LONGITUDE_FIELD ];
export default class SaLocation extends LightningElement {

    @api recordId;
    name;
    mapMarkers = [];
    @wire(getRecord, { recordId: '$recordId', fields: sadetailfields })
    loadSaDetail({error, data}) {
        if(error) {
            //TODO : handle error
        } else if (data) {
            //Get SAdetail Data
            this.name = getFieldValue(data, NAME_FIELD);
            const Latitude = getFieldValue(data, LOCATION_LATITUDE_FIELD);
            const Longitude = getFieldValue(data, LOCATION_LONGITUDE_FIELD);
            //Transform sadetail data into map markes
            this.mapMarkers = [{
                location: {Latitude, Longitude},
                title : this.name,
                description: `Coords : ${Latitude}, ${Longitude}`

        }];
    }
}
get saTile(){
    return (this.name) ? `${this.name}s  Konumu` :'SA Detail konumu';
}
}