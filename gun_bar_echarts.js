
var weatherIcons = {
    'M416': 'http://tse1.mm.bing.net/th?id=OIP.6J2Itfhiy2Zp5vJvaCbyrwHaC4&w=300&h=116&c=7&o=5&dpr=1.25&pid=1.7',
    'SCAR_L': 'http://tse4.mm.bing.net/th?id=OIP.HcL-geJ1lpg1hctrpmmYjQHaCa&w=277&h=97&c=7&o=5&dpr=1.25&pid=1.7',
    'M16A4': 'http://tse2.mm.bing.net/th?id=OIP.SozJUnUyFdHmJSwW806rYQHaEL&w=254&h=160&c=7&o=5&dpr=1.25&pid=1.7',
    'AKM':'data:image/jpeg;base64,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',
    'UMP9':'http://tse3.mm.bing.net/th?id=OIP.hJka0pmdZnuFr0hVFKytDAHaDD&w=300&h=123&c=7&o=5&dpr=1.25&pid=1.7',
    'S1897':'http://tse2.mm.bing.net/th?id=OIP.PS1tn8ursWW8j0MdrLyLsAHaE7&w=273&h=176&c=7&o=5&dpr=1.25&pid=1.7',
    'Mini14':'http://tse2.mm.bing.net/th?id=OIP.AWhOkJX0ZgmYlhxH05n78gHaDZ&w=285&h=137&c=7&o=5&dpr=1.25&pid=1.7',
    'Kar98k':'http://tse2.mm.bing.net/th?id=OIP.eqMFHiCvTY8tijrXyObq9gHaFj&w=257&h=193&c=7&o=5&dpr=1.25&pid=1.7',
    'S686':'http://tse3.mm.bing.net/th?id=OIP.br1x2k1gutEcmywvVz5uwgHaBY&w=309&h=64&c=7&o=5&dpr=1.25&pid=1.7',
    'SKS':'http://tse1.mm.bing.net/th?id=OIP.OflhGKXxVaYx3YEb_dqHqQHaHa&w=216&h=203&c=7&o=5&dpr=1.25&pid=1.7',
    
};

var seriesLabel = {
    normal: {
        show: true,
        textBorderColor: '#333',
        textBorderWidth: 2
    }
}

option= {
title : {
text  : '    PUBG枪械热度排行前十'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'shadow'
        }
    },
   
    grid: {
        left: 120
    },
    toolbox: {
        show: true,
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'value',
        name: '%',
        axisLabel: {
            formatter: '{value}'
        }
    },
    yAxis: {
        type: 'category',
        inverse: true,
        data: ['M416', 'SCAR_L', 'M16A4', 'AKM', 'UMP9', 'S1897', 'Mini14', 'Kar98k', 'S686', 'SKS'],
        axisLabel: {
            formatter: function (value) {
                return '{' + value + '| }\n{value|' + value + '}';
            },
            margin: 20,
            rich: {
                value: {
                    lineHeight: 10,
                    align: 'center'
                },
                M416: {
                    height: 28,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.M416
                    }
                },
                SCAR_L: {
                    height: 25,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.SCAR_L
                    }
                },
                M16A4: {
                    height: 45,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.M16A4
                    }
                },
                
                AKM: {
                    height: 23,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.AKM
                    }
                },
                
                UMP9: {
                    height: 27,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.UMP9
                    }
                },
                
                S1897: {
                    height: 42,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.S1897
                    }
                },
                
                Mini14: {
                    height: 31,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.Mini14
                    }
                },
                
                Kar98k: {
                    height: 48,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.Kar98k
                    }
                },
                
                S686: {
                    height: 13,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.S686
                    }
                },
                
                SKS: {
                    height: 63,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.SKS
                    }
                },
                
                
            }
        }
    },
    series: [
        {
            name: 'City Alpha',
            type: 'bar',
            data: [11.46616, 9.31516, 9.23597, 8.5337, 5.50711, 4.24259, 3.06682, 2.58347, 2.45388, 2.31351],
            label: seriesLabel,
            markPoint: {
                symbolSize: 1,
                symbolOffset: [0, '50%'],
                label: {
                   normal: {
                        //formatter: '{a|{a}\n}{b|{b} }{c|{c}}',
                        backgroundColor: 'rgb(242,242,242)',
                        borderColor: '#aaa',
                        borderWidth: 1,
                        borderRadius: 4,
                        padding: [4, 10],
                        lineHeight: 26,
                        // shadowBlur: 5,
                        // shadowColor: '#000',
                        // shadowOffsetX: 0,
                        // shadowOffsetY: 1,
                        position: 'right',
                        distance: 20,
                        rich: {
                            a: {
                                align: 'center',
                                color: '#fff',
                                fontSize: 18,
                                textShadowBlur: 2,
                                textShadowColor: '#000',
                                textShadowOffsetX: 0,
                                textShadowOffsetY: 1,
                                textBorderColor: '#333',
                                textBorderWidth: 2
                            },
                            b: {
                                 color: '#333'
                            },
                            c: {
                                color: '#ff8811',
                                textBorderColor: '#000',
                                textBorderWidth: 1,
                                fontSize: 22
                            }
                        }
                   }
                },
                
            }
        },
        
    ]
};
