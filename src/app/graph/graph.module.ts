import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { GraphComponent } from './graph.component';
import { RouterModule } from '@angular/router';
import { NgApexchartsModule } from 'ng-apexcharts';


@NgModule({
    imports: [
        CommonModule,
        NgApexchartsModule,
        RouterModule.forChild([{ path: '', component: GraphComponent }])
    ],
    declarations: [
        GraphComponent
    ],
})
export class GraphModule { }