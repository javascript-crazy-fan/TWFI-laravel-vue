<div class="pdf-page-outer" style="width:100%; font-family:Arial, Helvetica, sans-serif; font-weight:normal; font-size:14px;">
  <table class="header-table" border="0" cellpadding="0" cellspacing="0" style="width:100%;">
    <thead>
      <tr>
        <th align="left"> <img src="/pdf_images/img-1.png" width="201" height="33" alt="Title" /> </th>
        <th align="right" style="text-align:right;"> 
            <span style="font-weight:normal; font-size: 13px;"> <p style="display: block;"><strong>Project</strong> {{ $projectName }} #{{ $projectNumber }}</p>
            <p style="display: block;"><strong>Project Address</strong> {{ $projectAddress }} </p>
            <p style="display: block;"><strong>Date</strong> {{ $projectDate }} </p>
        </span>
        <br/>
            <span style="font-weight:normal;font-size: 13px;"> 
                <p style="display: block;"><strong>Created By</strong> {{ $createdBy }}</p>
                <p style="display: block;"><strong>Created</strong> {{ $createdDate }}</p>
                <p style="display: block;"><strong>Modified</strong> {{ $modifiedDate }} </p>
            </span>
        </th>
      </tr>
    </thead>
  </table>
  <table class="first-sec" cellpadding="0" cellspacing="0" style="width:100%">
    <tr>
      <td align="center" style="padding-bottom: 15px; padding-top: 30px;"><h2 style="font-size: 22px; font-weight: 600;">Job Safety Analysis</h2></td>
    </tr>
    <tr>
      <td style="border:1px solid #000; padding:15px;margin-bottom: 15px; text-transform: uppercase;">
        <p><strong style="font-weight: 600; font-size: 16px;display: block; margin-bottom: 15px;">Note </strong></p>
        <ul>
          <li style="font-size: 13px;">Every One Has Stop Work Authority</li>
          <li style="font-size: 13px;">FILTER FOOTING, INSPECTION, LINE OF FIRE, TOOLS & EQUIPMENT, REMEMBER</li>
        </ul></td>
    </tr>
  </table>
  <br>
  <table class="row-second" cellpadding="0" cellspacing="0" style="width:100%">
    <tr>
      <td width="50%" style="font-size:12px; color:#000; border:1px solid #000; border-bottom:none; border-right:none; padding:10px;"><p>PIC</p><p style="font-size: 14px;">{{ $pic }}</p></td>
      <td width="50%" style="font-size:12px; color:#000; border:1px solid #000; border-bottom:none;  padding:10px;"><p>Phone</p><p style="font-size: 14px;">{{ $phone }}</p></td>
    </tr>
    <tr>
      <td width="50%" style="font-size:12px; color:#000; border:1px solid #000; border-right:none; padding:10px;"><p>SSE</p> <p style="font-size: 14px;">{{ $sse }}</p></td>
      <td width="50%" style="font-size:12px; color:#000; border:1px solid #000;   padding:10px;">
        <p>Mentor</p> <p style="font-size: 14px;">{{ $mentor }}</p></td>
    </tr>
  </table>
  <table class="job-steps-section" cellpadding="0" cellspacing="0" width="100%" style="width:100%; margin-top:20px; border:1px solid #000;">
    <tr>
      <td colspan="2" style="background:#ccc; font-size:16px; color:#000; padding:10px;">Job Steps</td>
    </tr>
    
  </table>

  @foreach ($jobsteps as $key => $job)
  @if ($key == 0)
    <table class="row-second" cellpadding="0" cellspacing="0" style="width:100%;border:none;">
  @else 
    <table class="row-second" cellpadding="0" cellspacing="0" style="width:100%;border:none; margin-top: 20px;">
  @endif
    <tr>
      <td colspan="2" style="background:#f1f1f1; border:1px solid #000; font-size:14px; color:#000; padding:5px 10px;"><strong>Job Step # {{ $key+1 }}</strong></td>
    </tr>
    <tr>
      <td width="50%" style="font-size:12px; color:#000; border:1px solid #000; border-top:none; border-right:none; border-top:none; padding:10px;"><p>Job Step<p><p style="font-size: 14px;">{{ $job['step_title'] }}</p></td>
      <td width="50%" style="font-size:12px; color:#000; border:1px solid #000; border-top:none; padding:10px;"><p>Person Responsible</p><p style="font-size: 14px;">{{ $job['person_responsible'] }}</p></td>
    </tr>
  </table>
  
  <table class="row-third" cellpadding="0" cellspacing="0" style="width:100%; margin-top:20px;">
    <tr>
      <td colspan="2" style="font-size:14px; color:#000; border:1px solid #000; padding:10px;"><strong>Hazards and Controls</strong></td>
    </tr>
    @foreach ($job['additionals'] as $k => $additional)
    <tr>
      <td style="font-size:12px; color:#000; border:1px solid #000; border-right:none; border-top:none; padding: 10px;"><p>Hazard # {{$k+1}}</p><p style="font-size: 14px;"> {{ $additional['hazard'] }}</p></td>
      <td style="font-size:12px; color:#000; border:1px solid #000; border-top:none; padding:5px 10px;"><p>Control # {{ $k+1 }}</p><p style="font-size: 14px;"> {{ $additional['control'] }}</p></td>
    </tr>
    @endforeach
  </table>
  @endforeach
  
  <table class="job-steps-section" cellpadding="0" cellspacing="0" width="100%" style="width:100%; margin-top:20px; border:1px solid #000;">
    <tr>
      <td colspan="2" style="background:#ccc; font-size:14px; color:#000; padding:5px 10px;">Requirements / Pre-Conditions</td>
    </tr>
    <tr>
      <td colspan="2" style="background:#fff; border-top:1px solid #999; font-size:12px; color:#000; padding:10px;">{{ $requirements }}</td>
    </tr>
  </table>
  <table class="job-steps-section" cellpadding="0" cellspacing="0" width="100%" style="width:100%; margin-top:20px; border:1px solid #000;">
    <tr>
      <td colspan="2" style="background:#ccc; font-size:14px; color:#000; padding:10px;">Area / Equipment</td>
    </tr>
    <tr>
      <td colspan="2" style="background:#fff; border-top:1px solid #999; font-size:12px; color:#000; padding:10px;"><p>{{ $area }}</p></td>
    </tr>
  </table>
  <table class="job-steps-section" cellpadding="0" cellspacing="0" width="100%" style="width:100%; margin-top:20px; margin-bottom: 15px; border:1px solid #000;">
    <tr>
      <td colspan="2" style="background:#ccc; font-size:14px; color:#000; padding:10px;">Attachments</td>
    </tr>
    <tr>
      <td colspan="2" style="background:#fff; border-top:1px solid #999; font-size:12px; color:#000; padding:10px;">{{ $attachments }}</td>
    </tr>
  </table>
  
  <table class="job-steps-section" cellpadding="0" cellspacing="0" width="100%" style="width:100%; margin-top:20px; border:1px solid #000;">
      <tr>
      <td colspan="4" style="background:#ccc; font-size:16px; color:#000; padding:10px;">Signatures</td>
    </tr>

  </table>
  
  <table class="job-steps-section" cellpadding="0" cellspacing="0" width="100%" style="width:100%; margin-top:0; border:1px solid #000;">

        @php
            $i = 1
        @endphp
    
        @foreach ($signs as $sign)
          @if($i%4 == 1)
            <tr>
          @endif
            <td style="background:#fff; border:1px solid #000; font-size:20px; color:#000; padding:10px;" align="center" valign="top">
                <p style="font-size: 36px;"><strong>Signature of Employees</strong></p><br/><img src="/storage/{{ $sign['signature'] }}"><br><p style="font-size:30px;">{{ $sign['type_name'] }}</p>
            </td>
            @if($i%4 == 0)
            </tr>
            @endif

            @php
                $i++
            @endphp
        @endforeach
       
        @if($i%4 == 0)
            </tr>
        @endif

    
  </table>
</div>