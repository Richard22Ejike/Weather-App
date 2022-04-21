import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/service.dart';

import 'model.dart';




class detail extends StatefulWidget {
  
  
  @override
  State<StatefulWidget> createState() => _detailState();
}

class _detailState extends State<detail> {

  bool isSearching = false;
  final _cityTextController = TextEditingController();
  final _dataService = DataService();



  WeatherResponse? _response;

  String? City;
  String? timezone;
  String? tem;
  String? temmax;
  String? temmin;
  String? description;
  String? pressure;
  String? wind;
  String? humidity;
  String? country;
  String? icon;



  String? bgImg;






















  @override
  Widget build(BuildContext context) {

     if( _response?.cityName == null) {
     City = 'City';
   }  else{
     City =  _response?.cityName;
   }
    if( _response?.timezone.toDouble().toString() == null) {
      timezone = '3600';
    }  else{                          
      timezone =  _response?.timezone.toDouble().toString() ;
    }
    if( _response?.tempInfo.temperature == null) {
      tem = ' Search a City';
      }  else{
          tem =  '${_response?.tempInfo.temperature}°C';
      }
        if( _response?.weatherInfo.description == null) {
        description = '';
      }  else{
        description =  _response?.weatherInfo.description;
      }
       if( _response?.tempInfo.pressure == null) {
         pressure = '';
       }  else{
         pressure ='${_response?.tempInfo.pressure}';
       }
       if( _response?.tempInfo.temperaturemax == null) {
         temmax = '';
         }  else{
             temmax =  '${_response?.tempInfo.temperaturemax}°';
         }
       if( _response?.tempInfo.temperaturemin == null) {
         temmin = '';
         }  else{
             temmin =  '${_response?.tempInfo.temperaturemin}°';
         }
            if( _response?.windInfo.speed.toDouble().toString()== null) {
            wind = '';
          }  else{
            wind =  _response?.windInfo.speed.toDouble().toString();
          }
           if( _response?.tempInfo.humidity == null) {
             humidity = '';
           }  else{
             humidity = '${_response?.tempInfo.humidity}';
           }
           if( _response?.sysInfo.country == null) {
             country = '';
             }  else{
                country =  _response?.sysInfo.country;
             }
           if( _response?.iconUrl == null) {
             icon = '';
             }
           else{
                 icon =  _response?.iconUrl;
             }


            if(_response?.iconUrl == 'https://openweathermap.org/img/wn/04n@2x.png') {
                 bgImg = 'images/heavycloud.png';
               }
            else if(_response?.iconUrl == null) {
                  bgImg = 'images/clear.png';
                }
            if(_response?.iconUrl == 'https://openweathermap.org/img/wn/09d@2x.png') {
                 bgImg = 'images/heavyrain.png';
               }                                                                                               
            else if(_response?.iconUrl == 'https://openweathermap.org/img/wn/02d@2x.png') {
                      bgImg = 'images/lightcloud.png';
                    }
                 else if(_response?.iconUrl == 'https://openweathermap.org/img/wn/01d@2x.png') {
                       bgImg = 'images/clear.png';
                     }


                    if(_response?.iconUrl == 'https://openweathermap.org/img/wn/10n@2x.png') {
                         bgImg = 'images/lightrain.png';
                       }

                    if(_response?.iconUrl == 'https://openweathermap.org/img/wn/11d@2x.png') {
                         bgImg = 'images/thunderstorm.png';
                       }
                    else if(_response?.iconUrl == 'https://openweathermap.org/img/wn/13d@2x.png') {
                              bgImg = 'images/snow.png';
                            }
                         else if(_response?.iconUrl == 'https://openweathermap.org/img/wn/50d@2x.png') {
                               bgImg = 'images/a721051d793eb5e23dc68522db5e352d.jpg';
                             }


                               if(_response?.iconUrl == 'https://openweathermap.org/img/wn/04d@2x.png') {
                                    bgImg = 'images/heavycloud.png';
                                  }
                               if(_response?.iconUrl == 'https://openweathermap.org/img/wn/09n@2x.png') {
                                    bgImg = 'images/heavyrain.png';
                                  }
                               else if(_response?.iconUrl == 'https://openweathermap.org/img/wn/02n@2x.png') {
                                         bgImg = 'images/lightcloud.png';
                                       }
                                    else if(_response?.iconUrl == 'https://openweathermap.org/img/wn/01n@2x.png') {
                                          bgImg = 'images/clear.png';
                                        }


                                       if(_response?.iconUrl == 'https://openweathermap.org/img/wn/10d@2x.png') {
                                            bgImg = 'images/lightrain.png';
                                          }

                                       if(_response?.iconUrl == 'https://openweathermap.org/img/wn/11n@2x.png') {
                                            bgImg = 'images/thunderstorm.png';
                                          }
                                       else if(_response?.iconUrl == 'https://openweathermap.org/img/wn/13n@2x.png') {
                                                 bgImg = 'images/snow.png';
                                               }
                                            else if(_response?.iconUrl == 'https://openweathermap.org/img/wn/50n@2x.png') {
                                                  bgImg = 'images/a721051d793eb5e23dc68522db5e352d.jpg';
                                                }








    return  Scaffold(
      resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: !isSearching ? Text(" Weather App")
                  :TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _cityTextController,
                  decoration: InputDecoration(
                    hintText: 'Search City',
                    hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey
                  ),
                  textAlign: TextAlign.center

              ),
              leading: isSearching ?
              IconButton(onPressed: (){
                setState(() {
                  this.isSearching = !this.isSearching;

                }
                );
              },
                  icon: const Icon(
                      Icons.arrow_back
                  )):
              IconButton(
                icon:  Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ), onPressed: () async {  setState(() {
                this.isSearching = !this.isSearching;

              }
              ); },
              ),
              actions: [
                isSearching ?
                IconButton( onPressed: _search,
                    icon: const Icon(
                      Icons.search,
                    )):
                IconButton(onPressed: (){},
                    icon: const Icon(
                        Icons.menu
                    ))
              ],
            ),
            body: Container(
              child: Stack(
                children: [
                  Image.asset(
                bgImg!,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,

                              ),
                
                
                
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black38
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 150,
                                  ),
                                  Text(
                                    City!,
                                    style: GoogleFonts.lato(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),

                                  Text(
                                   DateFormat('yyyy-MM-dd KK:mm:ss a').format(DateTime.now()),

                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                   country!,
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tem!,
                                    style: GoogleFonts.lato(
                                      fontSize: 85,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),

                                  Row(

                                    children: [
                                      if (_response != null)
                                      Image.network(
                                       icon!,
                                        width: 34,
                                        height: 34,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        description!,
                                        style: GoogleFonts.lato(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 40),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white30,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Wind',
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        wind!,
                                        style: GoogleFonts.lato(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'km/h',
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            height: 5,
                                            width: 50,
                                            color: Colors.white38,
                                          ),
                                          Container(
                                            height: 5,

                                            color: Colors.greenAccent,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Pressure',
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        pressure!,
                                        style: GoogleFonts.lato(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'hPa',
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            height: 5,
                                            width: 50,
                                            color: Colors.white38,
                                          ),
                                          Container(
                                            height: 5,

                                            color: Colors.redAccent,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'humidity',
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        humidity!,
                                        style: GoogleFonts.lato(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '%',
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            height: 5,
                                            width: 50,
                                            color: Colors.white38,
                                          ),
                                          Container(
                                            height: 5,

                                            color: Colors.redAccent,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                        Column(
                                          children: [
                                            Text(
                                              'Max Tem',
                                              style: GoogleFonts.lato(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              temmax!,
                                              style: GoogleFonts.lato(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'C',
                                              style: GoogleFonts.lato(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: 50,
                                                  color: Colors.white38,
                                                ),
                                                Container(
                                                  height: 5,

                                                  color: Colors.redAccent,
                                                ),
                                              ],
                                            ),                                                             
                                          ],
                                        ),

                                        Column(
                                          children: [
                                            Text(
                                              'Min Tem',
                                              style: GoogleFonts.lato(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                             temmin!,
                                              style: GoogleFonts.lato(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'C',
                                              style: GoogleFonts.lato(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: 50,
                                                  color: Colors.white38,
                                                ),
                                                Container(
                                                  height: 5,

                                                  color: Colors.redAccent,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                          ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
        );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<WeatherResponse>('_response', _response));

  }
}