import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatelessWidget {
  final HomeController controller;
  const DateSelector({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Horizontal date selector
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...controller.dates.asMap().entries.map((entry) {
                final index = entry.key;
                final date = entry.value;
                final isSelected = index == controller.selectedDateIndex.value &&
                    controller.selectedDate.value == date['date'];

                return GestureDetector(
                  onTap: () {
                    controller.selectDate(date['date']!, index);
                    controller.showCalendar(true); // Open calendar when date is selected
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFE91E63) : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          date['day']!,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          date['date']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
          
              GestureDetector(
                onTap: () => controller.toggleCalendarView(),
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.showCalendar.value
                        ? const Color(0xFFE91E63)
                        : (_isCustomDateSelected() ? const Color(0xFFE91E63) : Colors.grey[200]),
                  ),
                  child: Icon(
                    controller.showCalendar.value ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: (controller.showCalendar.value || _isCustomDateSelected())
                        ? Colors.white
                        : Colors.grey[700],
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
        
        // Calendar and Slots together (when calendar is open)
        if (controller.showCalendar.value)
          _buildCalendarAndSlotsLayout(context),
        // Slots only (when calendar closed but date selected)
        if (!controller.showCalendar.value && controller.selectedDate.value.isNotEmpty) ...[
          const SizedBox(height: 24),
          SlotSelectionWidget(controller: controller),
        ],
      ],
    ));
  }

  Widget _buildCalendarAndSlotsLayout(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isSmallScreen = screenWidth < 600;

        final calendarWidget = CalendarPickerWidget(
          controller: controller,
          onDateSelected: (date) {
            final formattedDate = DateFormat('d').format(date);
            controller.selectDate(formattedDate, -1);
          },
        );

        final slotsWidget = SlotSelectionWidget(controller: controller);

        if (isSmallScreen) {
          // Stack layout for small screens
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                calendarWidget,
                const SizedBox(height: 16),
                slotsWidget,
              ],
            ),
          );
        } else {
          // Row layout for large screens
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: calendarWidget,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: slotsWidget,
                ),
              ],
            ),
          );
        }
      },
    );
  }

  bool _isCustomDateSelected() {
    return controller.selectedDate.value.isNotEmpty &&
        !controller.dates.any((d) => d['date'] == controller.selectedDate.value);
  }
}

class SlotSelectionWidget extends StatelessWidget {
  final HomeController controller;
  
  const SlotSelectionWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Available Slots',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 16),
          
          // Time period tabs
          Row(
            children: [
              _buildPeriodTab('Morning', 'morning'),
              const SizedBox(width: 12),
              _buildPeriodTab('Afternoon', 'afternoon'),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Slots grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: controller.availableSlots.length,
            itemBuilder: (context, index) {
              final slot = controller.availableSlots[index];
              return _buildSlotCard(slot);
            },
          ),
        ],
      ),
    ));
  }

  Widget _buildPeriodTab(String label, String period) {
    final isSelected = controller.selectedPeriod.value == period;
    
    return GestureDetector(
      onTap: () => controller.selectPeriod(period),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE91E63) : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.grey[700],
          ),
        ),
      ),
    );
  }

  Widget _buildSlotCard(Map<String, dynamic> slot) {
    final time = slot['time'] as String;
    final status = slot['status'] as String;
    final spotsLeft = slot['spotsLeft'] as int?;
    final isSelected = controller.selectedSlot.value == time;
    
    Color backgroundColor;
    Color borderColor;
    Color textColor;
    Color statusColor;
    
    if (isSelected) {
      backgroundColor = const Color(0xFF2196F3).withOpacity(0.1);
      borderColor = const Color(0xFF2196F3);
      textColor = const Color(0xFF2196F3);
      statusColor = const Color(0xFF2196F3);
    } else if (status == 'available') {
      backgroundColor = Colors.white;
      borderColor = const Color(0xFF4CAF50);
      textColor = Colors.black87;
      statusColor = const Color(0xFF4CAF50);
    } else if (status == 'limited') {
      backgroundColor = const Color(0xFFFFF3E0);
      borderColor = const Color(0xFFFF9800);
      textColor = Colors.black87;
      statusColor = const Color(0xFFFF9800);
    } else {
      backgroundColor = Colors.grey[100]!;
      borderColor = Colors.grey[300]!;
      textColor = Colors.grey[500]!;
      statusColor = Colors.grey[500]!;
    }
    
    return GestureDetector(
      onTap: status != 'booked' ? () => controller.selectSlot(time) : null,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              status == 'booked' 
                  ? 'Fully Booked' 
                  : status == 'limited' 
                      ? '$spotsLeft spot left'
                      : 'Available',
              style: TextStyle(
                fontSize: 10,
                color: statusColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarPickerWidget extends StatefulWidget {
  final HomeController controller;
  final Function(DateTime) onDateSelected;

  const CalendarPickerWidget({
    super.key,
    required this.controller,
    required this.onDateSelected,
  });

  @override
  State<CalendarPickerWidget> createState() => _CalendarPickerWidgetState();
}

class _CalendarPickerWidgetState extends State<CalendarPickerWidget> {
  late DateTime currentMonth;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    currentMonth = DateTime.now();
    _updateSelectedDateFromController();
  }

  @override
  void didUpdateWidget(CalendarPickerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateSelectedDateFromController();
  }

  void _updateSelectedDateFromController() {
    final selectedDateStr = widget.controller.selectedDate.value;
    if (selectedDateStr.isNotEmpty) {
      try {
        final day = int.parse(selectedDateStr);
        selectedDate = DateTime(currentMonth.year, currentMonth.month, day);
      } catch (e) {
        // Handle parsing error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 400,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      padding: const EdgeInsets.all(16),
      child: Obx(() {
        _updateSelectedDateFromController();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMonthHeader(),
            const SizedBox(height: 16),
            _buildWeekDayHeaders(),
            const SizedBox(height: 8),
            Flexible(
              child: _buildCalendarGrid(),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildMonthHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat('MMMM yyyy').format(currentMonth),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left, size: 20),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                setState(() {
                  currentMonth = DateTime(
                    currentMonth.year,
                    currentMonth.month - 1,
                  );
                });
              },
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.chevron_right, size: 20),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                setState(() {
                  currentMonth = DateTime(
                    currentMonth.year,
                    currentMonth.month + 1,
                  );
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWeekDayHeaders() {
    const weekDays = ['SU', 'MO', 'TU', 'WE', 'TH', 'FR', 'SA'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekDays.map((day) {
        Color textColor;
        if (day == 'FR') {
          textColor = const Color(0xFFE91E63);
        } else if (day == 'SA') {
          textColor = const Color(0xFF9C27B0);
        } else if (day == 'SU') {
          textColor = const Color(0xFFFF9800);
        } else {
          textColor = Colors.grey;
        }

        return Expanded(
          child: Text(
            day,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarGrid() {
    final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDayOfMonth = DateTime(currentMonth.year, currentMonth.month + 1, 0);
    
    // Adjust for Sunday start (0 = Sunday, 6 = Saturday)
    int startOffset = firstDayOfMonth.weekday % 7;
    final previousMonthDays = startOffset;
    final previousMonthLastDay = DateTime(currentMonth.year, currentMonth.month, 0).day;
    
    List<Widget> dayWidgets = [];

    for (int i = previousMonthDays; i > 0; i--) {
      dayWidgets.add(_buildDayCell(
        previousMonthLastDay - i + 1,
        isCurrentMonth: false,
      ));
    }

    for (int day = 1; day <= lastDayOfMonth.day; day++) {
      final date = DateTime(currentMonth.year, currentMonth.month, day);
      dayWidgets.add(_buildDayCell(
        day,
        date: date,
        isCurrentMonth: true,
      ));
    }

    final remainingCells = 35 - dayWidgets.length;
    for (int day = 1; day <= remainingCells; day++) {
      dayWidgets.add(_buildDayCell(
        day,
        isCurrentMonth: false,
      ));
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: dayWidgets,
    );
  }

  Widget _buildDayCell(int day, {DateTime? date, bool isCurrentMonth = true}) {
    final isSelected = selectedDate != null &&
        date != null &&
        selectedDate!.year == date.year &&
        selectedDate!.month == date.month &&
        selectedDate!.day == date.day;

    return GestureDetector(
      onTap: date != null && isCurrentMonth
          ? () {
              setState(() {
                selectedDate = date;
              });
              widget.onDateSelected(date);
            }
          : null,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE3F2FD) : Colors.transparent,
          border: isSelected
              ? Border.all(color: const Color(0xFF2196F3), width: 2)
              : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            day.toString(),
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isCurrentMonth
                  ? (isSelected ? const Color(0xFF2196F3) : Colors.black)
                  : Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }
}